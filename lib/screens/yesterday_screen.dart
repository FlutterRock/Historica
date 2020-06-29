import 'package:flutter/material.dart';
import 'package:hackaton_app/managers/today_manager.dart';
import 'package:hackaton_app/model/date.dart';
import 'package:hackaton_app/screens/loading_screen.dart';
import 'package:hackaton_app/screens/today_screen.dart';

import '../service_locator.dart';
import 'info_screen.dart';

class YesterdayScreen extends StatelessWidget {

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => TodayScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
  AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragUpdate: (details){
          if (details.delta.dx > 10) {
            // Right Swipe

            print('Swipe Right');
            // Sestivity is integer is used when you don't want to mess up vertical drag
          } else if(details.delta.dx < -10){
            //Left Swipe
            print('Swipe Left');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => TodayScreen()));
          }
        },
        child: Center(
          child: StreamBuilder(
            stream: sl<TodayManager>().yesterday$,
            builder: (BuildContext context, AsyncSnapshot<Date> snapshot) {
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.none: return Text('Select lot');
                case ConnectionState.waiting: return LoadingScreen();
                case ConnectionState.active: return InfoScreen(snapshot.data, 'yesterday');
                case ConnectionState.done: return Text('${snapshot.data} (closed)');
              }
              return null;
            },),
        ),
      ),
    );
  }
}
