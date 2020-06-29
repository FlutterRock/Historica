import 'package:flutter/material.dart';
import 'package:hackaton_app/managers/today_manager.dart';
import 'package:hackaton_app/model/date.dart';
import 'package:hackaton_app/screens/loading_screen.dart';
import 'package:hackaton_app/screens/tomorrow_screen.dart';
import 'package:hackaton_app/screens/yesterday_screen.dart';

import '../service_locator.dart';
import 'info_screen.dart';

class TodayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragUpdate: (details){
          if (details.delta.dx > 5) {
            // Right Swipe
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => YesterdayScreen()));
            print('Swipe Right');
            // Sestivity is integer is used when you don't want to mess up vertical drag
          } else if(details.delta.dx < -5){
            //Left Swipe
            print('Swipe Left');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => TomorrowScreen()));
          }
        },
        child: Center(
          child: StreamBuilder(
            stream: sl<TodayManager>().today$,
            builder: (BuildContext context, AsyncSnapshot<Date> snapshot) {
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.none: return Text('Select lot');
                case ConnectionState.waiting: return LoadingScreen();
                case ConnectionState.active: return InfoScreen(snapshot.data, "today");
                case ConnectionState.done: return Text('${snapshot.data} (closed)');
              }
              return null;
            },),
        ),
      ),
    );
  }
}
