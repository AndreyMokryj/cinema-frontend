import 'package:flutter/material.dart';
import 'package:flutterappweb/model/movie_model.dart';

class MoviePage extends StatefulWidget{
  final Movie movie;

  const MoviePage({Key key, this.movie}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MoviePageState();
  }
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}
