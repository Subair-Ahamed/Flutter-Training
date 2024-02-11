import "package:flutter/material.dart";

import "route_navigation.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Route Navigation",
        theme: ThemeData(primarySwatch: Colors.blue),
        // home: const FirstPage(),

        /*...Named Routes...*/
        // initialRoute: "/",
        // routes: {
        //   "/":(context) => const FirstPage(),
        //   "/second":(context) => const SecondPage(),
        //   "/third":(context) => const ThirdPage(),
        // }

        /*...OnGenerateRoute...*/
        onGenerateRoute: (RouteSettings routeSettings) {
          switch (routeSettings.name) {
            case "/":
              return MaterialPageRoute(builder: (context) => const FirstPage());
            case "/second":
              return MaterialPageRoute(
                  builder: (context) => const SecondPage());
            case "/third":
              return MaterialPageRoute(builder: (context) => const ThirdPage());
            default:
              return MaterialPageRoute(
                builder: (context) => Scaffold(
                  body: Container(
                      alignment: Alignment.center,
                      child: const Text("Unknown route")),
                ),
              );
          }
        });
  }
}
