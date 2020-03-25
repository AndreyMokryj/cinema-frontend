import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/model/login_model.dart';
import 'package:flutterappweb/model/movie_model.dart';
import 'package:flutterappweb/model/place_model.dart';
import 'package:flutterappweb/model/session_model.dart';
import 'package:flutterappweb/views/place_widget.dart';
import 'package:provider/provider.dart';

class SessionsWidget extends StatefulWidget{
  final Movie movie;

  const SessionsWidget({Key key, this.movie}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SessionsWidgetState();
  }
}

class _SessionsWidgetState extends State<SessionsWidget> {
  Session selectedSession;

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

    return Column(
        children: <Widget>[
          FutureBuilder(
            future: DBProvider.db.getSessions(widget.movie.id),
            builder: (context, snapshot){
              if (snapshot.hasData){
                final sessionMaps = snapshot.data as List;

                return Column(
                  children: <Widget>[
                    Text('Выберите сеанс:'),
                    ListView(
                      physics: null,
                      primary: false,
                      shrinkWrap: true,
                      children: sessionMaps.map((e) {
                        Session session = Session.fromMap(e);
                        return ListTile(
                          title: Text(session.formatDate()),
                          onTap: () async {
                            setState(() {
                              selectedSession = session;
                            });
                          },
                          selected: selectedSession?.id == session.id,
                        );
                      }).toList(),
                    ),
                  ],
                );
              }
              else {
                return Container(
                  child: Text('Нет свободных сеансов'),
                );
              }
            },
          ),

          selectedSession != null ?
          FutureBuilder(
            future: DBProvider.db.getPlaces(selectedSession.id),
            builder: (context, snapshot){
              if (snapshot.hasData && snapshot.connectionState == ConnectionState.done){
                var places = Place.getSortedFromMaps(snapshot.data);

                return Container(
                  child: GridView.count(
                    physics: null,
                    primary: false,
                    shrinkWrap: true,
                    crossAxisCount: 20,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                    children: places.map((e) => PlaceWidget(
                      place: e,
                      user: Provider.of<LoginModel>(context).user,
                    )).toList(),
                  ),
                );
              }
              else {
                return Container(
                  height: 350,
                );
              }
            },
          )
          : Container(),
        ],
      );
  }
}

