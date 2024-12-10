// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class Home_screen extends StatefulWidget {
//   const Home_screen({super.key});
//
//   @override
//   State<Home_screen> createState() => _Home_screenState();
// }
//
// class _Home_screenState extends State<Home_screen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Google map'),
//       ),
//       body: GoogleMap(
//           mapType: MapType.satellite,
//           initialCameraPosition: CameraPosition(
//             zoom: 16,
//             target: LatLng(23.78818634803755, 90.35097769219429),
//           ),
//           zoomControlsEnabled: true,
//           trafficEnabled: true,
//           markers: <Marker>{
//             Marker(
//               markerId: MarkerId('Initial'),
//               position: LatLng(23.78818634803755, 90.35097769219429),
//             ),
//           },
//           Pol<Polyline>{
//             Polyline(polylineId: 'initial')
//           }),
//     );
//   }
// }
