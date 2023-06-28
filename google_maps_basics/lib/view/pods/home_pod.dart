import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

final locationProvider = StateProvider<LocationData>((ref) {
  return LocationData.fromMap({"latitude": 0.0, "longitude": 0.0});
});

final bitmapProvider = FutureProvider<BitmapDescriptor>((ref) async {
  return await BitmapDescriptor.fromAssetImage(
    
      const ImageConfiguration(), "assets/main.png");

});
