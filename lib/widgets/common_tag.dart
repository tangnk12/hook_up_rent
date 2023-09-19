import 'package:flutter/material.dart';

class CommonTag extends StatelessWidget {
  final String title;
  final Color color;
  final Color backgroundColor;

  const CommonTag.origin(
    this.title, {
    super.key,
    this.color = Colors.black,
    this.backgroundColor = Colors.grey,
  });
  factory CommonTag(String title, {Color? color, Color? backgroundColor}) {
    switch (title) {
      case '近地铁':
        return CommonTag.origin(
          title,
          color: Colors.yellow,
          backgroundColor: Color.fromARGB(255, 239, 212, 91),
        );
      case '集中供暖':
        return CommonTag.origin(
          title,
          color: Colors.blue,
          backgroundColor: Color.fromARGB(255, 33, 155, 179),
        );
      case '随时看房':
        return CommonTag.origin(
          title,
          color: Colors.green,
          backgroundColor: Color.fromARGB(255, 147, 231, 131),
        );
      case '新上':
        return CommonTag.origin(
          title,
          color: Colors.red,
          backgroundColor: Color.fromARGB(255, 171, 16, 4),
        );
      default:
        return CommonTag.origin(title);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(right: 4),
      padding: EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(title, style: TextStyle(fontSize: 10, color: color)),
    );
  }
}
