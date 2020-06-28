import 'package:flutter/material.dart';
import 'package:hackaton_app/managers/today_manager.dart';
import 'package:hackaton_app/model/date.dart';
import 'package:hackaton_app/screens/today_screen.dart';

import '../service_locator.dart';
import 'info_screen.dart';

class TomorrowScreen extends StatelessWidget {
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
                    builder: (BuildContext context) => TodayScreen()));
            print('Swipe Right');
            // Sestivity is integer is used when you don't want to mess up vertical drag
          } else if(details.delta.dx < -5){
            //Left Swipe
            print('Swipe Left');

          }
        },
        child: Center(
          child: StreamBuilder(
            stream: sl<TodayManager>().tomorrow$,
            builder: (BuildContext context, AsyncSnapshot<Date> snapshot) {
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.none: return Text('Select lot');
                case ConnectionState.waiting: return CircularProgressIndicator();
                case ConnectionState.active: return InfoScreen(snapshot.data);
                case ConnectionState.done: return Text('${snapshot.data} (closed)');
              }
              return null;
            },),
        ),
      ),
    );
  }
}
