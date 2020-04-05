import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/helpers/constants.dart';
import 'package:flutterappweb/model/movie_model.dart';
import 'package:flutterappweb/views/menu_widget.dart';
import 'package:flutterappweb/views/movie_page.dart';
import 'package:flutterappweb/views/shopping_cart.dart';
import 'package:flutterappweb/views/movie_list.dart';

class MainView extends StatelessWidget {
  final String name;
  final int movieId;

  const MainView({Key key, this.name, this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Movie movie;
    String title;
    double w = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () {
        if (name != 'home') {
          Navigator.of(context).pop();
        }
      },
      child: FutureBuilder(
        future: movieId != null ? DBProvider.db.getMovie(movieId) : null,
        builder: (context, snapshot) {
          if (snapshot.hasData){
            movie = snapshot.data;
            title = '${movie.name} / ${movie.nameOriginal}';
          }

          if (snapshot.hasData || movieId == null) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: movieId != null,
//                automaticallyImplyLeading: false,
                title: Text(title ?? pageNames[name]),
                centerTitle: true,
                actions: <Widget>[
                  w <= 1200 ?
                  Builder(
                    builder: (context) => IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: (){
                        Scaffold.of(context).openEndDrawer();
                      },
                    ),
                  ) : Container(),
                ],
              ),
              body: Row(
                children: <Widget>[
                  w > 1200 ?
                  Expanded(
                    flex: 1,
                    child: MenuWidget(),
                  ) : Container(),
                  Expanded(
                    flex: 4,
                    child: Builder(
                      builder: (context) {
                        switch (name) {
                          case 'cart':
                            return ShoppingCart();
                            break;
                          case 'details':
                            return MoviePage(
                              movie: movie,
                            );
                            break;
                          default:
                            return MovieList();
                        }
                      },
                    ),
                  ),
                ],
              ),

              endDrawer: w <= 1200 ? Drawer(
                child: MenuWidget(),
              ) : null,
            );
          }
          else{
            return Container();
          }
        }
      ),
    );
  }
}