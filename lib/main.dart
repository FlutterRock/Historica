import 'package:flutter/material.dart';
import 'package:hackaton_app/screens/today_screen.dart';
import 'package:hackaton_app/service_locator.dart';

import 'screens/loading_screen.dart';

void main() {
  // add this, and it should be the first line in main method because we use async inside main!
  WidgetsFlutterBinding.ensureInitialized();

  // Setup GetIt service locator
  setUpServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodayScreen(),
    );
  }
}
