import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:location/location.dart' as LocationManager;
class MapsPage extends StatefulWidget{
  @override
  _MapsState createState() => _MapsState();
}
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: "AIzaSyABeN-Itphurpz5wRxaVQPmtp-liJJ5YM4" );
class _MapsState extends State<MapsPage>{

   final homeScaffoldKey = GlobalKey<ScaffoldState>();
   GoogleMapController mapController;
   var target = LatLng(0, 0);
   List<PlacesSearchResult> places = [];
   List<Marker> allMarkers = [];
   var _markers;
   bool isLoading = false;
   String errorMessage;
   @override
  void initState() {
    getUserLocation();
    super.initState();
  }

   @override
   Widget build(BuildContext context) {
     Widget expandedChild;
     if (isLoading) {
       expandedChild = Center(child: CircularProgressIndicator(value: null));
     } else if (errorMessage != null) {
       expandedChild = Center(
         child: Text(errorMessage),
       );
     } else {
       expandedChild = buildPlacesList();
     }

     return Scaffold(
         key: homeScaffoldKey,
         appBar: AppBar(
           title: const Text("Maps"),
           actions: <Widget>[
             isLoading
                 ? IconButton(
               icon: Icon(Icons.timer),
               onPressed: () {},
             )
                 : IconButton(
               icon: Icon(Icons.refresh),
               onPressed: () {
                 refresh();
               },
             ),
             IconButton(
               icon: Icon(Icons.search),
               onPressed: () {
                 _handlePressButton();
               },
             ),
           ],
         ),
         body:target==null?Center(child: CircularProgressIndicator()):GoogleMap(
           markers: _markers,
             onMapCreated: _onMapCreated,
             myLocationEnabled: true, initialCameraPosition: CameraPosition(target:target),
             ));
   }

   void refresh() {
     final center =  getUserLocation();

     mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
         target:  center, zoom: 15.0)));
     getNearbyPlaces(center);
   }

   void _onMapCreated(GoogleMapController controller) async {
     mapController = controller;
     refresh();
   }

   LatLng getUserLocation()  {
     var _center;
     final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
     geolocator
         .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
         .then((Position position) {
       setState(() {
          _center = LatLng(position.latitude, position.longitude);
          target = _center;
         print("${position.latitude} ${position.longitude}");
       });
     }).catchError((e) {

       print(e);
     });
     return _center;
   }

   void getNearbyPlaces(LatLng center) async {
     setState(() {
       this.isLoading = true;
       this.errorMessage = null;
     });

     final location = Location(center.latitude, center.longitude);
     final result = await _places.searchNearbyWithRadius(location, 2500);
     setState(() {
       this.isLoading = false;
       if (result.status == "OK") {
         this.places = result.results;
         result.results.forEach((f) {
           final markerOptions = Marker(
               position: LatLng(f.geometry.location.lat, f.geometry.location.lng),
               infoWindow: InfoWindow(title:"${f.name}"), markerId: MarkerId("12"));
           _markers.add(markerOptions);
         });
       } else {
         this.errorMessage = result.errorMessage;
       }
     });
   }

   void onError(PlacesAutocompleteResponse response) {
     homeScaffoldKey.currentState.showSnackBar(
       SnackBar(content: Text(response.errorMessage)),
     );
   }

   Future<void> _handlePressButton() async {
     try {
       final center = await getUserLocation();
       Prediction p = await PlacesAutocomplete.show(
           context: context,
           strictbounds: center == null ? false : true,
           apiKey: "AIzaSyABeN-Itphurpz5wRxaVQPmtp-liJJ5YM4",
           onError: onError,
           mode: Mode.fullscreen,
           language: "en",
           location: Location(center.latitude, center.longitude),
           radius:  1000);

     } catch (e) {
       return;
     }
   }


   ListView buildPlacesList() {
     final placesWidget = places.map((f) {
       List<Widget> list = [
         Padding(
           padding: EdgeInsets.only(bottom: 4.0),
           child: Text(
             f.name,
             style: Theme.of(context).textTheme.subtitle,
           ),
         )
       ];
       if (f.formattedAddress != null) {
         list.add(Padding(
           padding: EdgeInsets.only(bottom: 2.0),
           child: Text(
             f.formattedAddress,
             style: Theme.of(context).textTheme.subtitle,
           ),
         ));
       }

       if (f.vicinity != null) {
         list.add(Padding(
           padding: EdgeInsets.only(bottom: 2.0),
           child: Text(
             f.vicinity,
             style: Theme.of(context).textTheme.body1,
           ),
         ));
       }

       if (f.types?.first != null) {
         list.add(Padding(
           padding: EdgeInsets.only(bottom: 2.0),
           child: Text(
             f.types.first,
             style: Theme.of(context).textTheme.caption,
           ),
         ));
       }

       return Padding(
         padding: EdgeInsets.only(top: 4.0, bottom: 4.0, left: 8.0, right: 8.0),
         child: Card(
           child: InkWell(
             onTap: () {
             },
             highlightColor: Colors.lightBlueAccent,
             splashColor: Colors.red,
             child: Padding(
               padding: EdgeInsets.all(8.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: list,
               ),
             ),
           ),
         ),
       );
     }).toList();

     return ListView(shrinkWrap: true, children: placesWidget);
   }
}