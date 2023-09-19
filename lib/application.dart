import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/main.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hook_up_rent/page/loginMain.dart';

import 'package:hook_up_rent/routes.dart';
import 'package:hook_up_rent/scoped_model/room_filter.dart';
import 'package:hook_up_rent/utils/utils_pop.dart';

import 'package:scoped_model/scoped_model.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routes.configureRoutes(router);

    return ScopedModel<FilterBarModel>(
      model: FilterBarModel(),
      child: MaterialApp(
        home: MainPage(),
        scaffoldMessengerKey: UtilsPop.messengerKey,
        navigatorKey: navigatorKey,
        theme: ThemeData(primarySwatch: Colors.green),
        onGenerateRoute: router.generator,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
