import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
      ),
      home: ConnectivityPage(),
    );
  }
}

class ConnectivityPage extends StatefulWidget {
  const ConnectivityPage({Key? key}) : super(key: key);

  @override
  _ConnectivityPageState createState() => _ConnectivityPageState();
}

class _ConnectivityPageState extends State<ConnectivityPage> {
  late String data;

  @override
  void initState() {
    super.initState();
    data = "Checking...";
    checkStatus();
  }

  Future<void> checkStatus() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      data = "Mobile Network";
    } else if (connectivityResult == ConnectivityResult.wifi) {
      data = "Wifi network";
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      data = "Ethernet network";
    } else if (connectivityResult == ConnectivityResult.vpn) {
      data = "VPN network";
    } else if (connectivityResult == ConnectivityResult.bluetooth) {
      data = "Bluetooth network";
    } else if (connectivityResult == ConnectivityResult.other) {
      data = "Other network";
    } else {
      data = "No network";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Connectivity app",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        backgroundColor: Colors.blue[900],
        toolbarHeight: 60,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Current Network status:",style: TextStyle(fontSize: 23)),
            FutureBuilder(
              future: checkStatus(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  return Text(data);
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  data = "Checking...";
                  checkStatus();
                });
              },
              child: Text("Check status"),
            ),
          ],
        ),
      ),
    );
  }
}