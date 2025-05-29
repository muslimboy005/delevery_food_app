import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  final LatLng startLocation = LatLng(41.311081, 69.279773);
  LatLng? destination;
  Set<Polyline> polylines = {};
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    markers.add(
      Marker(
        markerId: MarkerId("origin"),
        position: startLocation,
        infoWindow: InfoWindow(
          title: "Rayhon Milliy Taomlari",
        ),
      ),
    );
  }

  void _drawSimplePolyline(LatLng start, LatLng end) {
    setState(() {
      polylines.clear();
      polylines.add(
        Polyline(
          polylineId: PolylineId("simple_route"),
          points: [start, end],
          color: Colors.orange,
          width: 6,
        ),
      );
    });

    LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(
        start.latitude < end.latitude
            ? start.latitude
            : end.latitude,
        start.longitude < end.longitude
            ? start.longitude
            : end.longitude,
      ),
      northeast: LatLng(
        start.latitude > end.latitude
            ? start.latitude
            : end.latitude,
        start.longitude > end.longitude
            ? start.longitude
            : end.longitude,
      ),
    );

    mapController.animateCamera(
      CameraUpdate.newLatLngBounds(bounds, 70),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: startLocation,
              zoom: 14,
            ),
            onMapCreated: (controller) {
              mapController = controller;
            },
            markers: markers,
            polylines: polylines,
            myLocationEnabled: true,
            onTap: (LatLng point) {
              setState(() {
                destination = point;
                markers.removeWhere(
                  (m) => m.markerId.value == "dest",
                );
                markers.add(
                  Marker(
                    markerId: MarkerId("dest"),
                    position: point,
                    infoWindow: InfoWindow(
                      title: "Yetkazib berish manzili",
                    ),
                  ),
                );
              });

              _drawSimplePolyline(startLocation, point);
            },
          ),

          if (destination != null)
            DraggableScrollableSheet(
              initialChildSize: 0.2,
              minChildSize: 0.2,
              maxChildSize: 0.55,
              builder: (context, scrollController) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 40,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius:
                                  BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundImage: AssetImage(
                                "assets/images/food.jpg",
                              ),
                            ),
                            SizedBox(width: 12),
                            Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Uttora Coffee House",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Ordered At 06 Sept, 10:00pm",
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "2x Burger\n4x Sandwich",
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        Center(
                          child: Text(
                            "20 min",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "ESTIMATED DELIVERY TIME",
                          ),
                        ),
                        SizedBox(height: 24),
                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            DeliveryStep(
                              text:
                                  "Your order has been received",
                              isDone: true,
                            ),
                            DeliveryStep(
                              text:
                                  "The restaurant is preparing your food",
                              isDone: true,
                            ),
                            DeliveryStep(
                              text:
                                  "Your order has been picked up for delivery",
                              isDone: false,
                            ),
                            DeliveryStep(
                              text: "Order arriving soon!",
                              isDone: false,
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        Divider(),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(
                                "assets/images/delivery.png",
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                children: [
                                  Text(
                                    "Robert F.",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),
                                  Text("Courier"),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.call,
                                color: Colors.orange,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.message,
                                color: Colors.orange,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class DeliveryStep extends StatelessWidget {
  final String text;
  final bool isDone;

  DeliveryStep({
    super.key,
    required this.text,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isDone
              ? Icons.check_circle
              : Icons.radio_button_unchecked,
          color: isDone ? Colors.orange : Colors.grey,
          size: 20,
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: isDone ? Colors.orange : Colors.grey,
          ),
        ),
      ],
    );
  }
}
