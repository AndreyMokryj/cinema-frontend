import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/model/movie_model.dart';
import 'package:flutterappweb/views/movie_grid.dart';

class TicketsList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
              crossAxisCount: 3,
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