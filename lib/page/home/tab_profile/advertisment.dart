import 'package:flutter/material.dart';

class Advertismenrt extends StatelessWidget {
  const Advertismenrt({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Image.network(
        'https://tva1.sinaimg.cn/large/006y8mN6ly1g6te62n8f4j30j603vgou.jpg',
        scale: 2,
      ),
    );
  }
}
