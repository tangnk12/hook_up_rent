import 'package:flutter/material.dart';

import 'data.dart';

var textStyle = TextStyle(color: Colors.black54);

class ItemWidget extends StatelessWidget {
  final InfoItem data;
  const ItemWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 100,
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 10)),
          Image.network(data.imageUrl, width: 120, height: 90),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(data.title,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data.source, style: textStyle),
                    Text(
                      data.time,
                      style: textStyle,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
