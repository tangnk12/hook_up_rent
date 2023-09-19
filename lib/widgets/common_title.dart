import 'package:flutter/material.dart';

class CommonTitle extends StatelessWidget {
  final String title;

  const CommonTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 50,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
