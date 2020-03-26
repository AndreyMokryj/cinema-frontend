import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/model/user_places_model.dart';
import 'package:provider/provider.dart';

void clearSelPlaces(BuildContext context) async{
  final placeIds = Provider.of<UserPlacesNotifier>(context, listen: false).placeIds;
  if(placeIds?.length > 0 ?? false) {
    await DBProvider.db.unbookPlaces(placeIds);
  }
  Provider.of<UserPlacesNotifier>(context, listen: false).clearPlaceIds();
}