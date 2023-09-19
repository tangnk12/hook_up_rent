// ignore_for_file: dead_code, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget{
  const NotFoundPage({Key? key}):super(key:key);
  
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title:Text ('404'),),
      // ignore: prefer_const_constructors
      body: Center(child: Text(' Not found page')),
    );
    throw UnimplementedError();
  }

}