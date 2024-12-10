import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Google Maps & Geolocator',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: MapPage(),
//     );
//   }
// }

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController _mapController;
  final Set<Polyline> _polylines = {};
  final List<LatLng> _polylineCoordinates = [];
  Marker? _currentMarker;
  LatLng? _lastPosition;

  @override
  void initState() {
    super.initState();
    _fetchCurrentLocation();
    _startLocationUpdates();
  }

  Future<void> _fetchCurrentLocation() async {
    final position = await _determinePosition();
    final currentLatLng = LatLng(position.latitude, position.longitude);

    setState(() {
      _lastPosition = currentLatLng;
      _currentMarker = Marker(
        markerId: MarkerId("current_location"),
        position: currentLatLng,
        infoWindow: InfoWindow(
          title: "My Current Location",
          snippet: "${position.latitude}, ${position.longitude}",
        ),
      );
      _polylineCoordinates.add(currentLatLng);
    });

    _mapController.animateCamera(
      CameraUpdate.newLatLngZoom(currentLatLng, 16),
    );
  }

  Future<void> _startLocationUpdates() async {
    Timer.periodic(Duration(seconds: 10), (_) async {
      final position = await _determinePosition();
      final currentLatLng = LatLng(position.latitude, position.longitude);

      setState(() {
        if (_lastPosition != null) {
          _polylines.add(Polyline(
            polylineId: PolylineId("tracking_polyline"),
            points: [..._polylineCoordinates, currentLatLng],
            color: Colors.blue,
            width: 5,
          ));
        }
        _lastPosition = currentLatLng;
        _currentMarker = Marker(
          markerId: MarkerId("current_location"),
          position: currentLatLng,
          infoWindow: InfoWindow(
            title: "My Current Location",
            snippet: "${position.latitude}, ${position.longitude}",
          ),
        );
        _polylineCoordinates.add(currentLatLng);
      });
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location services are disabled.");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Location permissions are denied.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permissions are permanently denied.");
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google Maps & Geolocator")),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(0, 0),
          zoom: 2,
        ),
        myLocationEnabled: true,
        markers: _currentMarker != null ? {_currentMarker!} : {},
        polylines: _polylines,
        onMapCreated: (controller) {
          _mapController = controller;
        },
      ),
    );
  }
}
