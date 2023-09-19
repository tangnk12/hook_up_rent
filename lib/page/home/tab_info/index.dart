import 'package:flutter/material.dart';
import 'package:hook_up_rent/page/home/info/index.dart';

import '../../../widgets/search_bar/index.dart';

class TabInfo extends StatefulWidget {
  const TabInfo({Key? key}) : super(key: key);

  @override
  _TabInfoState createState() => _TabInfoState();
}

class _TabInfoState extends State<TabInfo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement createState
    return Scaffold(
        appBar: AppBar(title: SearchBar(
            // shwoLocation: false,
            // showMap: false,
            onSearch: () {
          Navigator.of(context).pushNamed('search');
        })),
        body: ListView(
          children: [
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Info(),
            Info()
          ],
        ));
  }
}
