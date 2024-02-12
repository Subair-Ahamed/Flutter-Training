// import 'dart:convert';

class User {
  final int id;
  final String name;
  final String email;
  final Address address;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.address});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        address = Address.fromJson(json['address']);
}

class Address {
  final String street;
  final String city;

  Address({required this.street, required this.city});

  Address.fromJson(Map<String, dynamic> json)
      : street = json['street'],
        city = json['city'];
}
