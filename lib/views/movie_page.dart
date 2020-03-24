import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
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
    double w = MediaQuery
      .of(context)
      .size
      .width;
    double h = MediaQuery
      .of(context)
      .size
      .height;

    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Container(
            height: h * 0.8,
            child: Image.network(
              widget.movie.imageLink,
              fit: BoxFit.fitHeight,
            ),
          ),


          SizedBox(
            height: 20,
          ),
          Text(widget.movie.description),
        ],
      ),
    );
  }
}
