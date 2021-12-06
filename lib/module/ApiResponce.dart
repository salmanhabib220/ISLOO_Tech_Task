import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:isloo_tech_task/module/UserModule.dart';

class ApiService {
  final String key = "Your Key";
  var users = [];

  getUser() async {
    http.Response response;
    response = await http.get(Uri.parse("https://fakestoreapi.com/products/"));
    var jsonData = jsonDecode(response.body);
    for (var i in jsonData) {
      UserModel user = UserModel(i['id'], i['title'], i['price'], i['image'], i['description']);
      users.add(user);
    }
    return users;
  }

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }



  Future<String> getPlaceId(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    var placeId = json['candidates'][0]['place_id'] as String;

    return placeId;
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getPlaceId(input);
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?place_id=$placeId&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    var results = json['result'] as Map<String, dynamic>;

    return results;
  }

  Future getDirection(String origin, String destination) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?origin=$origin&destination=$destination&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);

    var results = {
      'bounds_ne': json['routes'][0]['bounds']['northeast'],
      'bounds_sw': json['routes'][0]['bounds']['southwest'],
      'start_location': json['routes'][0]['legs'][0]['start_location'],
      'end_location': json['routes'][0]['legs'][0]['end_location'],
      'polyline': json['routes'][0]['overview_polyline'][0]['points'],
    };
    print(results);
  }
}