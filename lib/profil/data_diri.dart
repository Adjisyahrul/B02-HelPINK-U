import 'package:flutter/material.dart';

class DataDiri {
  //int id;
  final String name;
  final String email;
  final String address;
  final String role;
  final String gender;
  final String phone;
  final String birthday;

  DataDiri(
      { //this.id,
      this.name,
      this.email,
      this.address,
      this.role,
      this.gender,
      this.phone,
      this.birthday});

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
