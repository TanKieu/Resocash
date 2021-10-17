// ignore_for_file: prefer_const_constructors

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:resocash/models/Cashier.dart';
import 'package:resocash/models/Request.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'firebase_db/request_dao.dart';
import 'package:resocash/models/Request.dart';

import 'modabottom.dart';

class Request extends StatefulWidget {
  Request({Key? key}) : super(key: key);

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  late String storeId = "";
  late String storeAddress = "";
  final requestDao = RequestDao();
  bool _visible = true;
  final _controller = TextEditingController();
  static const _locale = 'en';
  late String dbKey = "";
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));
  String get _currency =>
      NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

  void _setDBkey() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('dbkey', dbKey);
    });
  }

  void _sendRequest() {
    final request = RequestService(storeId, storeAddress,
        _controller.text.toString(), 'waiting', Cashier('', ''));
    String dbkey = requestDao.createRequest(request);
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Center(
                child: RequestProcess(
                  cash: request.cash,
                  dbtoken: dbkey,
                ),
              )),
    );
    setState(() {});
  }

  void _getStore() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      storeAddress = prefs.getString('storeAddress')!;
      storeId = prefs.getString('storeId')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      _getStore();
    }

    setState(() {
      _getStore();
    });
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Request',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
            child: Container(
              color: Colors.grey,
              height: 4.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      body: InkWell(
        onTap: () {
          setState(() {
            _visible = true;
          });
        },
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                      )
                    ],
                    borderRadius: BorderRadius.circular(
                      10,
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, left: 15, right: 15),
                  child: Text(
                    storeId,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                        )
                      ]),
                  child: TextField(
                    controller: _controller,
                    onTap: () {
                      setState(() {
                        _visible = false;
                      });
                    },
                    onChanged: (string) {
                      string = '${_formatNumber(string.replaceAll(',', ''))}';
                      _controller.value = TextEditingValue(
                        text: string,
                        selection:
                            TextSelection.collapsed(offset: string.length),
                      );
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 0,
                        ),
                      ),
                      hintText: 'Cash',
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                          )
                        ]),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.redAccent,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: Text(
                            storeAddress,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: TextButton.icon(
                  onPressed: _sendRequest,

                  //Navigator.pop(context);
                  //  showModalBottomSheet(
                  //      context: context,
                  //      builder: (BuildContext) {
                  //        return RequestProcess(
                  //          cash: _controller.text,
                  //        );
                  //      });

                  icon: Icon(
                    Icons.add,
                    size: 36,
                  ),
                  label: Text(
                    "Create Request",
                    style: TextStyle(fontSize: 24),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xff5BBCE1),
                      primary: Colors.white,
                      padding: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.grey),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blueAccent,
      floatingActionButton: Visibility(
        visible: _visible,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: 'Cancel Request',
          child: const Icon(Icons.cancel),
          backgroundColor: Colors.redAccent,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      // bottomNavigationBar: BottomAppBar(
      //   child: Row(
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: <Widget>[
      //       Container(
      //         height: 70.0,
      //         child: Column(children: [
      //           Padding(
      //             padding: EdgeInsets.all(0.0),
      //             child: IconButton(
      //               iconSize: 35.0,
      //               padding: EdgeInsets.only(left: 5.0),
      //               icon: Icon(Icons.notifications_active_sharp),
      //               color: Colors.lightBlue,
      //               onPressed: () {},
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.only(left: 5.0),
      //             child: Text(
      //               'Request',
      //               style: TextStyle(),
      //             ),
      //           ),
      //         ]),
      //       ),
      //       Container(
      //         height: 70.0,
      //         child: Column(children: [
      //           Padding(
      //             padding: EdgeInsets.all(0.0),
      //             child: IconButton(
      //               iconSize: 35.0,
      //               padding: EdgeInsets.only(right: 28.0),
      //               icon: Icon(Icons.receipt_long_outlined),
      //               color: Colors.lightBlue,
      //               onPressed: () {},
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.only(right: 28.0),
      //             child: Text(
      //               'Activity',
      //               style: TextStyle(),
      //             ),
      //           ),
      //         ]),
      //       ),
      //       SizedBox(
      //         width: 5.0,
      //       ),
      //       Container(
      //         height: 70.0,
      //         child: Column(children: [
      //           Padding(
      //             padding: EdgeInsets.all(0.0),
      //             child: IconButton(
      //               iconSize: 35.0,
      //               padding: EdgeInsets.only(left: 28.0),
      //               icon: Icon(Icons.chat_outlined),
      //               color: Colors.lightBlue,
      //               onPressed: () {},
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.only(left: 28.0),
      //             child: Text(
      //               'Inbox',
      //               style: TextStyle(),
      //             ),
      //           ),
      //         ]),
      //       ),
      //       Container(
      //         height: 70.0,
      //         child: Column(children: [
      //           Padding(
      //               padding: EdgeInsets.all(0.0),
      //               child: IconButton(
      //                 iconSize: 35.0,
      //                 padding: EdgeInsets.only(right: 5.0),
      //                 icon: Icon(Icons.account_circle),
      //                 color: Colors.lightBlue,
      //                 onPressed: () {},
      //               )),
      //           Padding(
      //             padding: const EdgeInsets.only(right: 5.0),
      //             child: Text(
      //               'Account',
      //               style: TextStyle(),
      //             ),
      //           ),
      //         ]),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
