import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Geolocator",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyLocator(),
    );
  }
}

class MyLocator extends StatefulWidget {
  const MyLocator({Key? key}) : super(key: key);

  @override
  State<MyLocator> createState() => _MyLocatorState();
}

class _MyLocatorState extends State<MyLocator> {
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
  }

  void getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print("Latitude: ${_currentPosition!.latitude}");
    print("Longitude: ${_currentPosition!.longitude}");

    setState(() {
      _currentPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Geo Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Location",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            if (_currentPosition != null)
              Column(
                children: [
                  Text(
                    "Latitude: ${_currentPosition!.latitude}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Longitude: ${_currentPosition!.longitude}",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ElevatedButton(
              onPressed: () {
                getLocation();
              },
              child: Text("Get Location"),
            )
          ],
        ),
      ),
    );
  }
}
