import 'package:flutter/material.dart';
import 'package:flutterappweb/model/place_model.dart';

class PlaceWidget extends StatefulWidget{
  final Place place;

  const PlaceWidget({Key key, this.place}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PlaceWidgetState();
  }

}

class _PlaceWidgetState extends State<PlaceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.green
        )
      ),
      child: FlatButton(
        padding: EdgeInsets.zero,
        child: Text('${widget.place.row} - ${widget.place.column}')
      ),
    );
  }
}