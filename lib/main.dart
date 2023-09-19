import 'package:flutter/material.dart';
import 'package:hook_up_rent/application.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hook_up_rent/model/user.dart';

import 'model/sys_user.dart';

// import 'package:learn/model/contact.dart';
// import 'contact_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  //open the box
  // var box = await Hive.openBox('qing');

  // Hive.registerAdapter(UserTestAdapter());
  // await Hive.openBox<UserTest>('user');

  await Firebase.initializeApp();
  runApp(const Application());
}

final navigatorKey = GlobalKey<NavigatorState>();
