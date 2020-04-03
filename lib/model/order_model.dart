class Order{
  String username;
  List<int> placeIds;
  int sum;

  Order({this.username, this.placeIds, this.sum});

  factory Order.fromMap(Map<String, dynamic> map) {
    final placeIdsStr = (map['placeIds'] as String).split(' ');
    List<int> placeIds = [];
    for(String el in placeIdsStr){
      if(el != "") {
        placeIds.add(int.parse(el));
      }
    };

    return Order(
      username: map['username'] as String,
      placeIds: placeIds,
      sum: map['sum'] as int,
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'username' : username,
      'placeIds' : placeIds,
      'sum' : sum,
    };
  }
}