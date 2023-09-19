import 'package:geocoding/geocoding.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ShowLocation extends StatefulWidget {
  const ShowLocation({super.key, required this.title});
  final String title;

  @override
  State<ShowLocation> createState() => _ShowLocationState();
}

class _ShowLocationState extends State<ShowLocation> {
  var _latitude = "";
  var _longitude = "";
  var _altitude = "";
  var _address = "";
  var _speed = "";

  Future<void> _updatePosition() async {
    Position pos = await _determinePosition();
    List pm = await placemarkFromCoordinates(pos.latitude, pos.longitude);
    setState(() {
      _latitude = pos.latitude.toString();
      _longitude = pos.longitude.toString();
      _altitude = pos.altitude.toString();
      _speed = pos.speed.toString();
      _address = pm[0].toString();
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('location service is disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('location permission is disabled');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('location permission permernant denied');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text('current location'),
          ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('your last know location is'),
            Text(
              "Latitude: " + _latitude,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text("Longitude" + _longitude,
                style: Theme.of(context).textTheme.headline5),
            Text("Altitude" + _altitude,
                style: Theme.of(context).textTheme.headline5),
            Text("Speed" + _speed,
                style: Theme.of(context).textTheme.headline5),
            Text('Address: '),
            Text(_address),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updatePosition,
        tooltip: "Get Gps Position",
        child: Icon(Icons.change_circle_outlined),
      ),
    );
  }
}
