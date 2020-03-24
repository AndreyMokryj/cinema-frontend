class Place{
  int id;
  int sessionId;
  int row;
  int column;
  int status;


  Place({
    this.id,
    this.sessionId,
    this.row,
    this.column,
    this.status,
  });

  factory Place.fromMap(Map<String, dynamic> map) => Place(
    id: map['id'] as int,
    sessionId: map['sessionId'] as int,
    row: map['row'] as int,
    column: map['column'] as int,
    status: map['status'] as int,
  );

  static List<Place> getSortedFromMaps(List maps){
    List<Place> list = [];
    for(Map map in maps){
      list.add(Place.fromMap(map));
    }
    list.sort((a, b) {
      if (a.row == b.row) {
        return a.column.compareTo(b.column);
      }
      return a.row.compareTo(b.row);
    });
    return list;
  }
}