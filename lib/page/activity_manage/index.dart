import 'package:flutter/material.dart';
import 'package:hook_up_rent/page/home/tab_search/dart_list.dart';
import 'package:hook_up_rent/widgets/room_list_widget.dart';

import '../../widgets/common_floating_action_button.dart';

class ActivityManagePage extends StatelessWidget {
  const ActivityManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
            new CommonFloatingActionButton('add a package', () {
          Navigator.of(context).pushNamed('activityAdd');
        }),
        appBar: AppBar(
          title: Text('Activity Manage'),
          bottom: TabBar(tabs: [
            Tab(
              text: 'Arrived',
            ),
            Tab(
              text: 'Pending',
            ),
          ]),
        ),
        body: TabBarView(children: [
          ListView(
            children: dataList.map((item) => RoomListtemWidght(item)).toList(),
          ),
          ListView(
            children: dataList.map((item) => RoomListtemWidght(item)).toList(),
          ),
        ]),
      ),
    );
  }
}
