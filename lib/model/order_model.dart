class Order{
  String username;
  List<int> placeIds;
  int sum;

  Order({this.username, this.placeIds, this.sum});

  factory Order.fromMap(Map<String, dynamic> map) => Order(
    username: map['username'] as String,
    placeIds: map['placeIds'] as List,
    sum: map['sum'] as int,
  );

  Map<String, dynamic> toMap(){
    return {
      'username' : username,
      'placeIds' : placeIds,
      'sum' : sum,
    };
  }
}