import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class User {
  String id;
  String name;
  String username;
  String ic;
  String living_address;
  String password;
 // String user_role;
  String phone_no;
  String email_address;

  //constructor
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.ic,
    required this.living_address,
    required this.password,
    //required this.user_role;
    required this.phone_no,
    required this.email_address,
  });
  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      id: parsedJson['id'],
      name: parsedJson['name'],
      username: parsedJson['username'],
      ic: parsedJson['ic'],
      living_address: parsedJson['living_address'],
      password: parsedJson['password'],
      phone_no: parsedJson['phone_no'],
      email_address: parsedJson['email_address'],
      //user_role: parsedJson['user_role'],

    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'location': location,
    };
  }
}
