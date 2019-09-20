import 'package:flutter/material.dart';
import 'package:flutter_background_location/flutter_background_location.dart';
import 'dart:async';

class LocationService extends StatefulWidget {
  @override
  _LocationServiceState createState() => _LocationServiceState();
}
class _LocationServiceState extends State<LocationService> {
  String latitude = "waiting...";
  String longitude = "waiting...";
  String altitude = "waiting...";
  String accuracy = "waiting...";
  String bearing = "waiting...";
  String speed = "waiting...";
  @override
  void initState() {
    super.initState();
    FlutterBackgroundLocation.startLocationService();
    Timer.periodic(Duration(seconds: 1), (timer) {
      getCurrentLocation();
      // FlutterBackgroundLocation.getLocationUpdates((location) {
      //   setState(() {
      //     this.latitude = location.latitude.toString();
      //     this.longitude = location.longitude.toString();
      //     this.accuracy = location.accuracy.toString();
      //     this.altitude = location.altitude.toString();
      //     this.bearing = location.bearing.toString();
      //     this.speed = location.speed.toString();
      //   });
      //   print("""
      //   Latitude:  $latitude
      //   Longitude: $longitude
      //   Altitude: $altitude
      //   Accuracy: $accuracy
      //   Bearing:  $bearing
      //   Speed: $speed
      //   """);
      // });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Background Location Service'),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              locationData("Latitude: " + latitude),
              locationData("Longitude: " + longitude),
              locationData("Altitude: " + altitude),
              locationData("Accuracy: " + accuracy),
              locationData("Bearing: " + bearing),
              locationData("Speed: " + speed),
              RaisedButton(
                  onPressed: () {
                    FlutterBackgroundLocation.startLocationService();
                  },
                  child: Text("Start Location Service")),
              RaisedButton(
                  onPressed: () {
                    FlutterBackgroundLocation.stopLocationService();
                  },
                  child: Text("Stop Location Service")),
              RaisedButton(
                  onPressed: () {
                    getCurrentLocation();
                  },
                  child: Text("Get Current Location")),
            ],
          ),
        ),
      ),
    );
  }
  Widget locationData(String data) {
    return Text(
      data,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      textAlign: TextAlign.center,
    );
  }
  getCurrentLocation() {
    FlutterBackgroundLocation().getCurrentLocation().then((location) {
      print("This is current Location " + location.longitude.toString() + " " + location.latitude.toString());
    });
  }
  @override
  void dispose() {
    FlutterBackgroundLocation.stopLocationService();
    super.dispose();
  }
}