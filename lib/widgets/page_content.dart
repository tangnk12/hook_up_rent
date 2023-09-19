//add new file
//add material depedencies
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../routes.dart';
//write no condition widget

class PageContent extends StatelessWidget {
  final String name;
  //add parameter
  const PageContent({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('current pages:$name'),
        ),
        body: ListView(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.home);
              },
              child: Text(Routes.home),
              // child: Text('Routes.home'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.login);
              },
              child: Text(Routes.login),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/aaa');
              },
              child: Text('not found page'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/room/2222');
              },
              child: Text('room detail, id:2222'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.register);
              },
              child: Text(Routes.register),
            ),
          ],
        ));
  }
}
