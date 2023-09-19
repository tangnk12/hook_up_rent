import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/page/home/index.dart';
import 'package:hook_up_rent/page/login.dart';
import 'package:hook_up_rent/page/verify_email.dart';

import 'auth_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('something wrong'));
            } else if (snapshot.hasData) {
              return VerifyEmailPage();
            } else {
              return AuthPage();
            }
          },
        ),
      );
}
