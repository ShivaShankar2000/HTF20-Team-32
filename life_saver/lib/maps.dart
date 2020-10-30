import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapsPage extends StatefulWidget{
  @override
  _MapsState createState() => _MapsState();
}
class _MapsState extends State<MapsPage>{
  var lat;
  var lon;
  LatLng _center;
  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }
  Position _currentPosition;
  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _center = LatLng(position.latitude, position.longitude);
        print("${position.latitude} ${position.longitude}");
      });
    }).catchError((e) {
      print(e);
    });
  }
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
        ),
        body: _center==null?Center(child: CircularProgressIndicator()):GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 14.0,
          ),
        ),
      ),
    );
  }
}