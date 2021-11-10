import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:resocash/network/Rating.dart';

import 'models/Request.dart';

class Rating extends StatefulWidget {
  final RequestService request;
  const Rating({Key? key, required this.request}) : super(key: key);

  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  double rate = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Rating for service',
            style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 35),
          ),
          SizedBox(
            height: 10,
          ),
          RatingBar.builder(
              initialRating: rate,
              minRating: 1,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
              onRatingUpdate: (rating) {
                rate = rating;
              }),
          SizedBox(
            height: 18,
          ),
          FractionallySizedBox(
            widthFactor: 0.40, // means 100%, you can change this to 0.8 (80%)
            child: TextButton(
              onPressed: () {
                RatingDao.rateService(widget.request, rate.toInt());
                Navigator.pop(context);
              },
              child: Text(
                "Confirm",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: Colors.blueAccent,
                  backgroundColor: Colors.green,
                  textStyle: TextStyle(fontSize: 24)),
            ),
          ),
        ],
      )),
    );
  }
}
