import 'package:flutter/material.dart';
import 'package:flutterappweb/model/movie_model.dart';

class MovieGrid extends StatelessWidget{
  final Movie movie;

  const MovieGrid({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Movie ${movie.name} / ${movie.nameOriginal}"),
    );
  }
}