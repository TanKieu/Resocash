class Cashier {
  final String id;
  final String name;

  Cashier(this.id, this.name);
  Cashier.fromJson(Map<dynamic, dynamic> json)
      : id = json['cashierID'],
        name = json['cashierName'];
  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'cashierID': id,
        'cashierName': name,
      };
}
