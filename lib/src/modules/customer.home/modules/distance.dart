import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pattern_m/src/constants/constants.dart';
import 'package:pattern_m/src/modules/customer.home/modules/looking_for_riders.dart';

import '../provider/functions.dart';

class DistanceBetweenTwoPoints extends ConsumerWidget {
  const DistanceBetweenTwoPoints({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('distance between two points'),
      ),
      body: Stack(
        children: [
          GoogleMapviewTwoPoints(),
          Positioned(
            bottom: 50,
            left: 70,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LookingForRiders()),
                );
              },
              child: const Text('Confrim pickup and Delivery point'),
            ),
          )
        ],
      ),
      // floatingActionButton: SizedBox(
      //   height: 100,
      //   width: 200,
      //   child: FittedBox(
      //     child: FloatingActionButton(
      //       onPressed: () {},
      //       child: const Text('Confirm pickup & Delivery point'),
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class GoogleMapviewTwoPoints extends ConsumerWidget {
  const GoogleMapviewTwoPoints({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<LatLng>>(
      future: getSomePoints(ref),
      builder: (context, snapshot) {
        final data = snapshot.data;

        if (snapshot.hasData) {
          return distanceTwoPoints(data!, context);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

Widget distanceTwoPoints(List<LatLng> latLng, BuildContext context) {
  final Set<Marker> markers = {};

  final Set<Polyline> polyline = {};

  // List<LatLng> routeCoords;

  markers.add(
    Marker(
      markerId: MarkerId(
        latLng.toString(),
      ),
      position: latLng[0],
    ),
  );

  print(latLng.length.toString() + 'gg'.toString());

  markers.add(
    Marker(
      markerId: MarkerId(
        latLng.toString(),
      ),
      position: latLng[latLng.length - 1],
    ),
  );

  print(latLng.length.toString() + 'gg'.toString());

//  Future<List<LatLng> > getSomePoints() async {
//     routeCoords = (await googleMapPolyline.getCoordinatesWithLocation(
//         origin: latLng[0], destination: latLng[1], mode: RouteMode.bicycling))!;
//     return routeCoords;
//   }

  polyline.add(
    Polyline(
        polylineId: PolylineId('1'),
        points: latLng,
        visible: true,
        width: 4,
        color: Colors.blue,
        startCap: Cap.roundCap,
        endCap: Cap.buttCap),
  );

  return Stack(
    children: [
      GoogleMap(
        polylines: polyline,
        markers: markers,
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(
          target: latLng[0],
          zoom: 11,
        ),
      ),
      // Positioned(
      //   bottom: 50,
      //   left: 70,
      //   child: ElevatedButton(
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => const LookingForRiders()),
      //       );
      //     },
      //     child: const Text('Confrim pickup and Delivery point'),
      //   ),
      // )
    ],
  );
}
