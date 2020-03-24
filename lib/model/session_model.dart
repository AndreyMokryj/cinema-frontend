import 'package:flutterappweb/helpers/constants.dart';

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

  String formatDate(){
    List<String> strings = dateTime.split('T');
    final time = strings[1];
    final date = strings[0];

    List<String> dates = date.split('-');
    final year = dates[0];
    final month = monthNames[dates[1]];
    final day = dates[2];

    return '$day $month $year -- $time';
  }

  factory Session.fromMap(Map<String, dynamic> map) => Session(
    id: map['id'] as int,
    movieId: map['movieId'] as int,
    dateTime: map['dateTime'] as String,
    isFull: map['isFull'] as int,
  );
}