import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/model/movie_model.dart';
import 'package:flutterappweb/views/movie_grid.dart';

class MovieList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    int count = 1;
    if (w >= 600) {
      count = 2;
    }
    if (w >= 900) {
      count = 3;
    }

    return FutureBuilder(
      future: DBProvider.db.getMovies(),
      builder:(context, snapshot) {
        if (snapshot.hasData) {
          final movieMaps = snapshot.data as List;
          return Container(
            padding: EdgeInsets.all(5),
            child: GridView.count(
              crossAxisSpacing: 5,
              mainAxisSpacing: 20,
              crossAxisCount: count,
              children: movieMaps.map((e) => MovieGrid(
                movie: Movie.fromMap(e),
              )).toList(),
            ),
          );
        }
        else {
          return Container();
        }
      }
    );
  }
}