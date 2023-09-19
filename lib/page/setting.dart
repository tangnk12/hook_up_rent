import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/page/login.dart';
import 'package:hook_up_rent/utils/common_toast.dart';

import 'loginMain.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Setting'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Signedin as',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    user!.email!,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      onPressed: () {
                        CommonToast.showToast(
                          'logout succesful ',
                        );
                        FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushNamed('/login');
                      },
                      child: Text(
                        'logout',
                        style: TextStyle(color: Colors.red),
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
