import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sos_mobile_app/controller/auth_contoller.dart';
import 'package:sos_mobile_app/controller/report_controller.dart';
import 'package:sos_mobile_app/utils/strings.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({Key? key}) : super(key: key);

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  final AuthController _authController = Get.put(AuthController());
  final ReportConteroller _reportConteroller = Get.put(ReportConteroller());
  // set map controller
  late GoogleMapController googleMapController;
  // init map camera
  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(32.37048830543665, 15.086157669110053), zoom: 14);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.selectLocation,
          style: const TextStyle(fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
        // -------------------------------------------------------------------- //
        onLongPress: (position) {
          setState(() {
            moveCameraAndCreateMarker(position.latitude, position.longitude);
          });

          // close map after delay
          Timer(const Duration(seconds: 3), () {
            Navigator.pop(context);
          });
        },
      ),
      // -------------------------------------------------------------------- //
      // get current location
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.red[400],
        onPressed: () async {
          Position position = await _determinePosition();
          setState(() {
            moveCameraAndCreateMarker(position.latitude, position.longitude);
          });
          // close map after delay
          Timer(const Duration(seconds: 3), () {
            Navigator.pop(context);
          });
        },
        label: Text(Strings.takeLocation),
        icon: const Icon(Icons.location_history),
      ),
      // -------------------------------------------------------------------- //
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }

  // move camera to selected location
  moveCameraAndCreateMarker(double latitude, double longitude) {
    // navigate camera to currect user location
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(latitude, longitude), zoom: 14)));

    markers.clear();
    // add marker to current user location
    markers.add(Marker(
        markerId: const MarkerId('currentLocation'),
        position: LatLng(latitude, longitude)));

    // store latlong in Get state citizen controller
    _authController.citizenLatitude.value = latitude;
    _authController.citizenLongitude.value = longitude;
    // store latlong in Get state report controller
    _reportConteroller.latitude.value = latitude.toString();
    _reportConteroller.latitude.value = longitude.toString();
  }
}
