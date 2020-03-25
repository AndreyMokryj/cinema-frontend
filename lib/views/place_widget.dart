import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/model/login_model.dart';
import 'package:flutterappweb/model/place_model.dart';
import 'package:flutterappweb/model/user_model.dart';
import 'package:provider/provider.dart';

class PlaceWidget extends StatefulWidget{
  final Place place;
  final User user;

  const PlaceWidget({Key key, this.place, this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PlaceWidgetState();
  }
}

class _PlaceWidgetState extends State<PlaceWidget> {
  Place place;
  User user;

  @override
  void initState() {
    place = widget.place;
    user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var placeColor;
    var placeStatus;
    if (place.status == 0){
      placeStatus = PlaceStatus.FREE;
    }
    if (place.status > 0 && place.username != user.username){
      placeColor = Colors.red;
      placeStatus = PlaceStatus.NA;
    }
    if (place.status == 1 && place.username == user.username){
      placeColor = Colors.yellow;
      placeStatus = PlaceStatus.SELECTED;
    }
    if (place.status == 2 && place.username == user.username){
      placeColor = Colors.green;
      placeStatus = PlaceStatus.BOOKED;
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.green
        ),
        color: placeColor,
      ),
      child: FlatButton(
        padding: EdgeInsets.zero,
        child: Text('${widget.place.row} - ${widget.place.column}'),

        onPressed: placeStatus == PlaceStatus.FREE ? _selectPlace
        : (placeStatus == PlaceStatus.SELECTED ? _unselectPlace : null),
      ),
    );
  }

  @override
  void dispose() {
    if(place.status == 1 && place.username == widget.user.username) {
      _unselectPlace();
    }
    super.dispose();
  }

  void _selectPlace() async{
    place.status = 1;
    place.username = user.username;
    await DBProvider.db.selectPlace(place.id, widget.user);

    setState(() {
      place = place;
    });
  }

  void _unselectPlace()async{
    place.status = 0;
    place.username = null;
    await DBProvider.db.unselectPlace(place.id);

    setState(() {
      place = place;
    });
  }
}

enum PlaceStatus {FREE, SELECTED, BOOKED, NA}