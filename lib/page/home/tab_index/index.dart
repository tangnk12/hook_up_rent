// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hook_up_rent/page/home/tab_index/index_navigator.dart';
import 'package:hook_up_rent/page/home/tab_index/index_recommend.dart';

import 'package:hook_up_rent/widgets/common_swipper.dart';

import '../../../widgets/search_bar/index.dart';
import '../info/index.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          shwoLocation: true,
          showMap: true,
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
        ),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          CommonSwipper(),
          IndexNavigator(),
          IndexRecommond(),
          Info(
            showTitle: true,
          ),
          Text('Showing content area'),
        ],
      ),
    );
  }
}
