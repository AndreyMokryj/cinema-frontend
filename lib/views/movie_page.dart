import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/model/movie_model.dart';
import 'package:flutterappweb/views/sessions_widget.dart';

class MoviePage extends StatelessWidget{
  final Movie movie;

  const MoviePage({Key key, this.movie}) : super(key: key);

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
              movie.imageLink,
              fit: BoxFit.fitHeight,
            ),
          ),


          SizedBox(
            height: 20,
          ),
          Text(movie.description),
          SizedBox(
            height: 20,
          ),

          SessionsWidget(
            movie: movie,
          ),
        ],
      ),
    );
  }
}
