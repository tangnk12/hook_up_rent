//create new file
//add matrrial, page content
// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/main.dart';
import 'package:hook_up_rent/page/home/tab_index/index.dart';
import 'package:hook_up_rent/page/home/tab_info/index.dart';
import 'package:hook_up_rent/page/home/tab_profile/index.dart';
import 'package:hook_up_rent/page/home/tab_search/index.dart';

//prepare 4 tab content view
//prepare 4 navigationBarItem

List<Widget> tabViewList = [
  TabIndex(),
  TabSearch(),
  TabInfo(),
  TabProfile(),
];

List<BottomNavigationBarItem> barItemList = [
  BottomNavigationBarItem(label: 'main', icon: Icon(Icons.home)),
  BottomNavigationBarItem(label: 'search', icon: Icon(Icons.search)),
  BottomNavigationBarItem(label: 'information', icon: Icon(Icons.info)),
  BottomNavigationBarItem(label: 'mine', icon: Icon(Icons.account_circle)),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext content) {
    return Scaffold(
      body: tabViewList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: barItemList,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
