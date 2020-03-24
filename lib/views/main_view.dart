import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/helpers/constants.dart';
import 'package:flutterappweb/model/login_model.dart';
import 'package:flutterappweb/model/movie_model.dart';
import 'package:flutterappweb/views/menu_widget.dart';
import 'package:flutterappweb/views/movie_page.dart';
import 'package:flutterappweb/views/shopping_cart.dart';
import 'package:flutterappweb/views/tickets_list.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  final String name;
  final int movieId;

  const MainView({Key key, this.name, this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Movie movie;
    String title;
//    if(movieId != null){
//      movie = DBProvider.db.getMovie(movieId) as Movie;
//      title = '${movie.name} / ${movie.nameOriginal}';
//    }

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
                automaticallyImplyLeading: false,
                title: Text(title ?? pageNames[name]),
                centerTitle: true,
              ),
              body: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: MenuWidget(),
                  ),
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
                            return TicketsList();
                        }
                      },
                    ),
                  ),
                ],
              ),
//        floatingActionButton: FloatingActionButton(
//          onPressed: (){
//            Provider.of<LoginModel>(context, listen: false).logOut();
//            Navigator.of(context).pushNamed('/login');
//          },
//        ),
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