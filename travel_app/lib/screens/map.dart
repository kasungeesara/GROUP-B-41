import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const LatLng _pKandy = LatLng(7.2931208, 80.6350358);
  static const LatLng _pColombo = LatLng(6.9388614, 79.8542005);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _pKandy,
          zoom: 13,
        ),
        
      ),
    );
  }
}
