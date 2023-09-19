// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_image.dart';
import './index_navigator_item.dart';

class IndexNavigator extends StatelessWidget {
  const IndexNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6, bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: indexNavigatorItemList
            .map((item) => InkWell(
                  onTap: () {
                    item.onTap!(context);
                  },
                  child: Column(children: <Widget>[
                    Image.asset(
                      (item.imageUri),
                      width: 47.5,
                    ),
                    Text(
                      item.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ]),
                ))
            .toList(),
      ),
    );
  }
}
