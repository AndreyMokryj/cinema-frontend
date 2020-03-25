class Order{
  String username;
  List<int> placeIds;

  Order({this.username, this.placeIds});

  Map<String, dynamic> toMap(){
    return {
      'username' : username,
      'placeIds' : placeIds,
    };
  }
}