import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/model/movie_model.dart';
import 'package:flutterappweb/model/session_model.dart';

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

                return ListView(
                  shrinkWrap: true,
                  children: sessionMaps.map((e) {
                    Session session = Session.fromMap(e);
                    return ListTile(
                      title: Text(session.formatDate()),
                      onTap: () {
                        setState(() {
                          selectedSession = session;
                        });
                      },
                      selected: selectedSession == session,
                    );
                  }).toList(),
                );
              }
              else {
                return Container();
              }
            },
          )


        ],
      );
  }
}
