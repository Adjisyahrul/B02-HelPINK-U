import 'package:flutter/material.dart';

class DataDiri {
  //int id;
  final String name;
  late final String email;
  late final String address;
  late final String role;
  late final String gender;
  late final String phone;
  late final String birthday;

  DataDiri(
      { //this.id,
      required this.name,
      required this.email,
      required this.address,
      required this.role,
      required this.gender,
      required this.phone,
      required this.birthday});

  factory DataDiri.fromJson(Map<String, dynamic> json) {
    return DataDiri(
        //id: json['id'],
        name: json['name'],
        email: json['email'],
        address: json['address'],
        role: json['role'],
        gender: json['gender'],
        phone: json['phone'],
        birthday: json['birthday']);
  }

  dynamic toJson() => {
        //'id': id,
        'name': name,
        'email': email,
        'address': address,
        'role': role,
        'gender': gender,
        'phone': phone,
        'birthday': birthday
      };
}
