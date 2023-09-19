import 'package:flutter/material.dart';
import 'package:hook_up_rent/page/home/tab_index/index_recommond_data.dart';

var textStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

class IndexRecommondItemWidget extends StatelessWidget {
  final IndexRecommendItem data;
  const IndexRecommondItemWidget(this.data, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement createState
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(data.navigateUrl);
        },
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          width: (MediaQuery.of(context).size.width - 10 * 3) / 2,
          padding: EdgeInsets.all(10.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(data.title, style: textStyle),
                    Text(data.subTitle, style: textStyle),
                  ],
                ),
                Image.asset(data.imageUrl, width: 55.0),
              ]),
        ));
  }
}
