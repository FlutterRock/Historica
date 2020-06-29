import 'package:flutter/material.dart';
import 'package:hackaton_app/screens/today_screen.dart';
import 'package:hackaton_app/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'managers/today_manager.dart';
import 'screens/loading_screen.dart';

void main() async {
  // add this, and it should be the first line in main method because we use async inside main!
  WidgetsFlutterBinding.ensureInitialized();
  int timestamp = DateTime.now().millisecondsSinceEpoch;

  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('myTimestampKey', timestamp);
  // Setup GetIt service locator
  setUpServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    sl<TodayManager>().inRequest.add(DateTime.now());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodayScreen(),
    );
  }
}
