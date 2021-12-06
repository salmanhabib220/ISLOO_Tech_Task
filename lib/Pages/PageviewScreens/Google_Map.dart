import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:isloo_tech_task/application_bloc/Application_Bloc.dart';
import 'package:isloo_tech_task/module/ApiResponce.dart';
import 'package:isloo_tech_task/widgets/Custom_textfield.dart';
import 'package:isloo_tech_task/widgets/elevatedbutton.dart';

class Googlemap extends StatefulWidget {
  @override
  State<Googlemap> createState() => _GooglemapState();
}

class _GooglemapState extends State<Googlemap> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController? newGoogleMapController;
  TextEditingController _searchcontroller = TextEditingController();

  TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();
  Set<Marker> _markers = Set<Marker>();
  Set<Polyline> _polylines = Set<Polyline>();

  final applicationbloc = ApplicationBloc();

  int polylineIdcountr = 1;
  @override
  void initState() {
    super.initState();
    _setMarker(LatLng(32.187691, 74.194450));
  }

  void _setMarker(LatLng point) {
    _markers.add(
      Marker(markerId: MarkerId('Marker'), position: point),
    );
  }

  // void _setpolylines(List points) {
  //   final String polylineIdVal = 'polyline_$polylineIdcountr';
  //   polylineIdcountr++;
  //   _polylines.add(
  //     Polyline(
  //       polylineId: PolylineId(polylineIdVal),
  //       width: 2,
  //       color: Colors.blue,
  //       points: points
  //           .map((point) => LatLng(point.latitude, point.longitude))
  //           .toList(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Jobs',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Icon(
            Icons.menu_rounded,
            color: Colors.amber,
            size: 30,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.search, size: 30, color: Colors.amber),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 25,
          ),
          Center(
            child: Text("Location", style: TextStyle(fontWeight: FontWeight.bold))),
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, right: 20.0, left: 20.0, bottom: 10.0),
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    markers: _markers,
                    polylines: _polylines,
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: true,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        31.975508,
                        74.223801,
                      ),
                      zoom: 14,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controllerGoogleMap.complete(controller);
                      newGoogleMapController = controller;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 20.0),
                    child: Row(
                      children: [
                        CustomTextfield(
                          conttroller: _searchcontroller,
                          data: IconButton(
                              onPressed: ()  {
                              },
                              icon: Icon(
                                Icons.record_voice_over,
                              )),
                          hinttext: 'Search By Place',
                          width: 200.0,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.menu_rounded,
                          size: 30,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomTextfield(
                          conttroller: _originController,
                          data: IconButton(
                            onPressed: () async {
                              var direction = await ApiService().getDirection(
                                  _originController.text,
                                  _destinationController.text);
                              _goToPlace(direction['start_location']['lat'],
                                  direction['start_location']['lng']);
                            },
                            icon: Icon(Icons.location_city),
                          ),
                          hinttext: 'Pick Up Location',
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomTextfield(
                          conttroller: _destinationController,
                          data: IconButton(
                            onPressed: () async {
                              var direction = await ApiService().getDirection(
                                  _originController.text,
                                  _destinationController.text);
                              _goToPlace(direction['start_location']['lat'],
                                  direction['start_location']['lng']);
                            },
                            icon: Icon(Icons.pin_drop),
                          ),
                          hinttext: 'Drop Off Location',
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(child: CustomElevatedbutton('Proceed', 130.0))
        ],
      ),
    );
  }

  Future<void> _goToPlace(double lat, double lng) async {
    final GoogleMapController controller = await _controllerGoogleMap.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(lat, lng), zoom: 14),
    ));
    _setMarker(LatLng(lat, lng));
  }
}
