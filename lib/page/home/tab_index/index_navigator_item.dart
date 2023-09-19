import 'package:flutter/material.dart';

//prepare resource
class IndexNavigatorItem {
  final String title;
  final String imageUri;
  final Function(BuildContext contenxt)? onTap;
  IndexNavigatorItem(this.title, this.imageUri, this.onTap);
}

List<IndexNavigatorItem> indexNavigatorItemList = [
  IndexNavigatorItem(
      'personal rent', 'static/images/home_index_navigator_total.png',
      (BuildContext context) {
    Navigator.of(context).pushNamed('login');
  }),
  IndexNavigatorItem(
      'rent together', 'static/images/home_index_navigator_share.png',
      (BuildContext context) {
    Navigator.of(context).pushNamed('login');
  }),
  IndexNavigatorItem('find', 'static/images/home_index_navigator_map.png',
      (BuildContext context) {
    Navigator.of(context).pushNamed('login');
  }),
  IndexNavigatorItem(
      'propose rent', 'static/images/home_index_navigator_rent.png',
      (BuildContext context) {
    Navigator.of(context).pushNamed('login');
  }),
];
