import 'package:flutter/material.dart';
import 'package:hook_up_rent/page/home/tab_search/filter_bar/index.dart';
import 'package:hook_up_rent/widgets/search_bar/index.dart';

import '../../../widgets/room_list_widget.dart';
import 'dart_list.dart';
import 'filter_bar/filter_drawer.dart';

class TabSearch extends StatefulWidget {
  @override
  State<TabSearch> createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: FilterDrawer(),
        appBar: AppBar(
            actions: [Container()],
            backgroundColor: Colors.white,
            elevation: 0,
            title: SearchBar(
              shwoLocation: true,
              showMap: true,
              onSearch: () {
                Navigator.of(context).pushNamed('search');
              },
            )),
        body: Column(
          children: [
            Container(
              height: 40,
              child: FilterBar(
                onChange: (data) {},
              ),
            ),
            Expanded(
                child: ListView(
              children: dataList
                  .map((item) => RoomListtemWidght(item))
                  // height: 200,
                  // margin: EdgeInsets.only(bottom: 10),
                  // decoration: BoxDecoration(color: Colors.grey)))
                  .toList(),
            ))
          ],
        ));
  }
}
