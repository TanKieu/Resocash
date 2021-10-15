class Cashier {
  final String id;
  final String name;

  Cashier(this.id, this.name);
  Cashier.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        name = json['name'];
  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'id': id,
        'name': name,
      };
}
