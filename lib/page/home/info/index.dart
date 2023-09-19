import 'package:flutter/material.dart';
import 'package:hook_up_rent/page/home/info/item_widget.dart';
import 'data.dart';

class Info extends StatelessWidget {
  final bool showTitle;
  final List<InfoItem> dataList;

  const Info({Key? key, this.showTitle = false, this.dataList = infoData});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(children: <Widget>[
        if (showTitle)
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10.0),
            child: Text('new information',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500)),
          ),
        Column(
          children: dataList
              .map((item) => ItemWidget(item))
              // height: 100,
              // margin: EdgeInsets.only(bottom: 10.0),
              // decoration: BoxDecoration(color: Colors.red)))
              .toList(),
        ),
      ]),
    );
  }
}
