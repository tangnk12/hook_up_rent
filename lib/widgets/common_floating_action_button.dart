import 'package:flutter/material.dart';

class CommonFloatingActionButton extends StatelessWidget {
  final String title;
  final Function onTap;
  const CommonFloatingActionButton(
    this.title,
    this.onTap, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        child: Container(
          margin: EdgeInsets.all(20),
          height: 40,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
          ),
        ));
  }
}
