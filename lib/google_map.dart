
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController>_controller=
      Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
      target: 
  LatLng(10.015861, 76.341866),
    zoom: 14.4746,

  );
  static const CameraPosition _kLake = CameraPosition(
    bearing: 0,
      target: LatLng(10.015861, 76.341866),
        tilt: 19.45,
        zoom: 14.4746,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition:_kGooglePlex,
        onMapCreated: (
        GoogleMapController controller
        )
        {
          _controller.complete(controller);

        },

      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: _goToTheLake,
          label: const Text('To the Lake!'),
      icon: const Icon(Icons.directions_boat),
      ),
    );
  }
  Future<void> _goToTheLake()
async{
    final GoogleMapController
    controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));

} }

