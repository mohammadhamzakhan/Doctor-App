import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  static const CameraPosition initialCamera = CameraPosition(
    target: LatLng(34.02926806948283, 71.53867416867796),
    zoom: 14,
  );

  Completer<GoogleMapController> controller = Completer();

  List<Marker> myMarker = [];
  List<Marker> nearbyMarkers = [];

  @override
  void initState() {
    super.initState();
    myMarker.addAll([
      Marker(
        markerId: MarkerId('First'),
        position: LatLng(34.01788613223943, 71.64167099484911),
        infoWindow: InfoWindow(title: 'Chamkani'),
      ),
      Marker(
        markerId: MarkerId('Second'),
        position: LatLng(34.039510507789565, 71.41233139524134),
        infoWindow: InfoWindow(title: 'Nasar Bagh Road'),
      ),
    ]);
  }

  // Function to get user's current location
  Future<LatLng> getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return LatLng(position.latitude, position.longitude);
  }

  // Function to fetch nearby doctors or clinics
  void fetchNearbyDoctorsClinics(LatLng userLocation) {
    // Here you would call an API or access a database to get nearby doctors or clinics
    // For demonstration purpose, let's assume we have a list of doctors and clinics
    // Add example nearby markers
    nearbyMarkers.addAll([
      Marker(
        markerId: MarkerId('Doctor1'),
        position: LatLng(userLocation.latitude + 0.001, userLocation.longitude + 0.001),
        infoWindow: InfoWindow(title: 'Doctor 1'),
      ),
      Marker(
        markerId: MarkerId('Doctor2'),
        position: LatLng(userLocation.latitude - 0.001, userLocation.longitude - 0.001),
        infoWindow: InfoWindow(title: 'Doctor 2'),
      ),
    ]);
  }

  // Function to update nearby markers on the map
  void updateNearbyMarkers(LatLng userLocation) async {
    fetchNearbyDoctorsClinics(userLocation);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: initialCamera,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController c) {
          controller.complete(c);
        },
        markers: Set<Marker>.of(myMarker + nearbyMarkers),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_on),
        onPressed: () async {
          GoogleMapController c = await controller.future;
          LatLng userLocation = await getUserLocation();
          c.animateCamera(CameraUpdate.newLatLng(userLocation));
          updateNearbyMarkers(userLocation);
        },
      ),
    );
  }
}