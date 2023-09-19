import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/page/home/tab_profile/advertisment.dart';
import 'package:hook_up_rent/page/home/tab_profile/header.dart';

import '../info/index.dart';
import 'function_button.dart';

class TabProfile extends StatelessWidget {
  const TabProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('My Profile'),
        actions: [
          IconButton(
            onPressed: () {
              //Navigator.of(context).pushNamed('setting');
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: ListView(
        children: [
          Header(),
          FunctionButton(),
          Text('is content area'),
          Advertismenrt(),
          Info(
            showTitle: true,
          ),
        ],
      ),
    );
  }
}
