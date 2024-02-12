import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

import 'package:http/http.dart' as http;
import 'package:http_package/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<User>>? futureUsers; //can be null
  @override
  void initState() {
    super.initState();
    futureUsers = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter Networking",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<User>>(
          future: futureUsers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final users = snapshot.data;
              if (users != null) {
                return ListView.separated(
                    itemCount: users.length,
                    separatorBuilder: (_, __) => const Divider(thickness: 3),
                    itemBuilder: (_, index) {
                      final user = users[index];

                      return ListTile(
                        title: Text("Name : ${user.name}"),
                        subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Email: ${user.email}"),
                              Text("Street: ${user.address.street}"),
                              Text("City: ${user.address.city}")
                            ]),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                      );
                    });
              } else {
                return const Text("Users not found");
              }
            } else if (snapshot.hasError) {
              return Text("failed to get users : ${snapshot.error}");
            }
            return Center(
              child: Platform.isAndroid
                  ? const CircularProgressIndicator()
                  : const CupertinoActivityIndicator(),
            );
          }),
    );
  }

  Future<List<User>> fetchUsers() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (response.statusCode == 200) {
      final List<dynamic> userData = jsonDecode(response.body);
      final users = userData.map((user) => User.fromJson(user)).toList();
      return users;
    } else {
      throw Exception("Failed to fetch data");
    }
  }
}
