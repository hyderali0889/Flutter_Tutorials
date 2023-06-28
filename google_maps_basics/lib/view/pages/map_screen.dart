import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_basics/container/get_user_loc.dart';
import 'package:google_maps_basics/view/pods/home_pod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  Completer<GoogleMapController> controller = Completer();

  @override
  void initState() {
    super.initState();
    getUserLoc(controller);
  }

  getUserLoc(Completer<GoogleMapController> controller) async {
    LocationData? data = await getLoc();

    if (data == null) {
      return;
    }
    GoogleMapController cont = await controller.future;

    ref.read(locationProvider.notifier).update((state) => data);
    cont.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        zoom: 14,
        target:
            LatLng(data.latitude!.toDouble(), data.longitude!.toDouble()))));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LatLng initialLocation = const LatLng(37.422131, -122.084801);
    CameraPosition pos = CameraPosition(target: initialLocation, zoom: 14);
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
      width: size.width,
      height: size.height,
      child: ref.watch(bitmapProvider).when(data: (data) {
        List<Marker> markers = [
          Marker(
              markerId: const MarkerId("1"),
              icon: ref.watch(bitmapProvider).asData!.value,
              position: LatLng(ref.watch(locationProvider).latitude!.toDouble(),
                  ref.watch(locationProvider).longitude!.toDouble()))
        ];
        return Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              compassEnabled: true,
              
              myLocationEnabled: true,
              mapToolbarEnabled: true,
              markers: Set.of(markers),
              initialCameraPosition: pos,
              onMapCreated: (GoogleMapController control) {
                controller.complete(control);
              },
            ),
          ],
        );
      }, error: (error, stackTrace) {
        return Text(error.toString());
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    )));
  }
}
