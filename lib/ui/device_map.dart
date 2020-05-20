import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hanseinthantiot/network/model/device_data.dart';

class DeviceMap extends StatefulWidget {
  @override
  _DeviceMapState createState() => _DeviceMapState();
}

class _DeviceMapState extends State<DeviceMap> {
  DeviceData deviceData = DeviceData();
  GoogleMapController mapController;
  String myLoc;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(22.554823, 114.06394),
    zoom: 15,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: onMapCreated,
            initialCameraPosition: _kGooglePlex,
          )
        ],
      ),
    );
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }
}
