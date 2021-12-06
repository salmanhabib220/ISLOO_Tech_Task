import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:isloo_tech_task/module/ApiResponce.dart';
import 'package:isloo_tech_task/module/UserModule.dart';

class ApplicationBloc with ChangeNotifier {
  final placeservice = ApiService();

  Position? currentLocation;
  List<PlaceSearch>? searchResult;

 searchPlaces(String searchingTerm) async {
    searchResult = await placeservice.getAutocomplete(searchingTerm);
  }
}
