import 'package:flutter/material.dart';

import 'index_recommond_data.dart';
import 'index_recommond_item_widget.dart';

class IndexRecommond extends StatelessWidget {
  final List<IndexRecommendItem>? dataList;

  const IndexRecommond({Key? key, this.dataList = indexRecommendData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(color: Color(0x0800000)),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Hike location suggest',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600)),
            Text('more',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
          ]),
          Padding(padding: EdgeInsets.all(5)),
          Wrap(
            spacing: 10, //item between space
            runSpacing: 10, //when change row, the space between up and down
            children: dataList!
                .map((item) => IndexRecommondItemWidget(item))
                // Container(
                //       decoration: BoxDecoration(color: Colors.red),
                //       width: (MediaQuery.of(context).size.width - 10 * 3) / 2,
                //       height: 100,
                //     ))
                .toList(),
          )
        ]));
  }
}
