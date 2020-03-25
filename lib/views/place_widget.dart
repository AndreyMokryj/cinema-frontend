import 'package:flutter/material.dart';
import 'package:flutterappweb/model/login_model.dart';
import 'package:flutterappweb/model/place_model.dart';
import 'package:provider/provider.dart';

class PlaceWidget extends StatefulWidget{
  final Place place;
  final String userName;

  const PlaceWidget({Key key, this.place, this.userName}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PlaceWidgetState();
  }
}

class _PlaceWidgetState extends State<PlaceWidget> {
  Place place;
  String userName;

  @override
  void initState() {
    place = widget.place;
    userName = widget.userName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var placeColor;
    var placeStatus;
    if (place.status == 0){
      placeStatus = PlaceStatus.FREE;
    }
    if (place.status > 0 && place.userName != userName){
      placeColor = Colors.red;
      placeStatus = PlaceStatus.NA;
    }
    if (place.status == 1 && place.userName == userName){
      placeColor = Colors.yellow;
      placeStatus = PlaceStatus.SELECTED;
    }
    if (place.status == 2 && place.userName == userName){
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

  void _selectPlace() async{
    place.status = 1;
    place.userName = userName;
    await

    setState(() {
      place = place;
    });
  }

  void _unselectPlace()async{
    place.status = 0;
    place.userName = null;

    setState(() {
      place = place;
    });
  }
}

enum PlaceStatus {FREE, SELECTED, BOOKED, NA}