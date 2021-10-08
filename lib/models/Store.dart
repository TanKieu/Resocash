class Store {
  final String id;
  final String brandId;
  final String storeAddress;
  final bool storeStatus;
  final String areaId;

  Store(
    this.id,
    this.brandId,
    this.storeAddress,
    this.storeStatus,
    this.areaId,
  );

  // Store.fromJson(Map<String, dynamic> json) {
  //   this.id = json['id'];
  //   this.brandId = json['brandId'];
  //   this.storeAddress = json['storeAddress'];
  //   this.storeStatus = json['storeStatus'];
  //   this.areaId = json['areaId'];
  // }
}
