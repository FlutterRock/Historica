import 'package:flutter/material.dart';
import 'package:hackaton_app/managers/today_manager.dart';
import 'package:hackaton_app/model/day.dart';
import 'package:hackaton_app/services/month.dart';

import '../constants.dart';
import '../service_locator.dart';

class DateShow extends StatelessWidget {
  final String aDay;

  DateShow(this.aDay);


  @override
  Widget build(BuildContext context) {

    switch(aDay){
      case 'yesterday':
        return StreamBuilder(
          stream: sl<TodayManager>().dayYesterday$,
          builder: (BuildContext context, AsyncSnapshot<Day> snapshot) {
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.none: return Text('Select lot');
              case ConnectionState.waiting: return CircularProgressIndicator();
              case ConnectionState.active: return _date(snapshot.data);
              case ConnectionState.done: return Text('${snapshot.data} (closed)');
            }
            return null;
          },
        );
      case 'today':
        return StreamBuilder(
          stream: sl<TodayManager>().dayToday$,
          builder: (BuildContext context, AsyncSnapshot<Day> snapshot) {
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.none: return Text('Select lot');
              case ConnectionState.waiting: return CircularProgressIndicator();
              case ConnectionState.active: return _date(snapshot.data);
              case ConnectionState.done: return Text('${snapshot.data} (closed)');
            }
            return null;
          },
        );
      case 'tomorrow':
        return StreamBuilder(
          stream: sl<TodayManager>().dayTomorrow$,
          builder: (BuildContext context, AsyncSnapshot<Day> snapshot) {
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.none: return Text('Select lot');
              case ConnectionState.waiting: return CircularProgressIndicator();
              case ConnectionState.active: return _date(snapshot.data);
              case ConnectionState.done: return Text('${snapshot.data} (closed)');
            }
            return null;
          },
        );
    }
  }
  Widget _date(Day day) {
    print(day.day);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${day.day}',
          //DateTime.now().day.toString(),
          style: kDateTextStyle,
        ),
        Text(
          Month().getMonthName(day.month),
          //'${day.month}',
          style: kDateTextStyle,
        ),
      ],
    );
  }
}
