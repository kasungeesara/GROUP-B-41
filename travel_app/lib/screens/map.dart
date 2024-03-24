import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const LatLng _pKandy = LatLng(7.2931208, 80.6350358);

  // void _getCurrentLocation() async {
  //   FocusScope.of(context).unfocus();
  //   Location location = new Location();

  //   bool serviceEnabled;
  //   PermissionStatus permissionGranted;
  //   LocationData locationData;

  //   serviceEnabled = await location.serviceEnabled();
  //   if (!serviceEnabled) {
  //     serviceEnabled = await location.requestService();
  //     if (!serviceEnabled) {
  //       return;
  //     }
  //   }

  //   permissionGranted = await location.hasPermission();
  //   if (permissionGranted == PermissionStatus.denied) {
  //     permissionGranted = await location.requestPermission();
  //     if (permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }

  //   setState(() {
  //     _isGettingLocation = true;
  //     _isLocationSet = true;
  //   });

  //   locationData = await location.getLocation();

  //   final lat = locationData.latitude;
  //   final lng = locationData.longitude;

  //   latitudeFinal = locationData.latitude!;
  //   longitudeFinal = locationData.longitude!;

  //   final url = Uri.parse(
  //     "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=AIzaSyAcKZHMOpRIqKUPAAP1U-n8Vp6nEtg7pcs",
  //   );

  //   final response = await http.get(url);
  //   final resData = json.decode(response.body);
  //   final currentLocation = resData["results"][0]["formatted_address"];

  //   _pickedLocation = currentLocation;

  //   setState(() {
  //     _isGettingLocation = false;
  //   });
  //   print(longitudeFinal);
  //   print(latitudeFinal);
  //   print(currentLocation);
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _pKandy,
          zoom: 10,
        ),
      ),
    );
  }
}
