import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Archieve{
   String id;
   String location;
  //constructor
  Archieve({
    required this.id,
    required this.location,

  });
   factory Archieve.fromJson(Map<String, dynamic> parsedJson) {
    return Archieve(
      id: parsedJson['id'],
      location: parsedJson['location'],
      
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'location': location,
      
    };
  }
}
