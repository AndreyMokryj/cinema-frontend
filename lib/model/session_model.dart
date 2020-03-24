class Session{
  int id;
  int movieId;
  String dateTime;
  int isFull;


  Session({
    this.id,
    this.movieId,
    this.dateTime,
    this.isFull,
  });

  factory Session.fromMap(Map<String, dynamic> map) => Session(
    id: map['id'] as int,
    movieId: map['movieId'] as int,
    dateTime: map['dateTime'] as String,
    isFull: map['isFull'] as int,
  );
}