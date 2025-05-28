import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  final LatLng startLocation = const LatLng(41.311081, 69.279773);

  LatLng? destination;
  Set<Polyline> polylines = {};
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();

    markers.add(
      Marker(
        markerId: const MarkerId("origin"),
        position: startLocation,
        infoWindow: const InfoWindow(title: "Rayhon Milliy Taomlari"),
      ),
    );
  }

  void _drawSimplePolyline(LatLng start, LatLng end) {
    setState(() {
      polylines.clear();
      polylines.add(
        Polyline(
          polylineId: const PolylineId("simple_route"),
          points: [start, end],
          color: Colors.blue,
          width: 5,
        ),
      );
    });

    LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(
        start.latitude < end.latitude ? start.latitude : end.latitude,
        start.longitude < end.longitude ? start.longitude : end.longitude,
      ),
      northeast: LatLng(
        start.latitude > end.latitude ? start.latitude : end.latitude,
        start.longitude > end.longitude ? start.longitude : end.longitude,
      ),
    );

    mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: startLocation, zoom: 14),
        onMapCreated: (controller) {
          mapController = controller;
        },
        markers: markers,
        polylines: polylines,
        myLocationEnabled: true,
        onTap: (LatLng point) {
          setState(() {
            destination = point;
            markers.removeWhere((m) => m.markerId.value == "dest");
            markers.add(
              Marker(
                markerId: const MarkerId("dest"),
                position: point,
                infoWindow: const InfoWindow(title: "Yetkazib berish manzili"),
              ),
            );
          });

          _drawSimplePolyline(startLocation, point);
        },
      ),
    );
  }
}
