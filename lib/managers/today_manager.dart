import 'package:hackaton_app/model/date.dart';
import 'package:hackaton_app/services/today_service.dart';
import 'package:rxdart/rxdart.dart';

import '../service_locator.dart';

class TodayManager{
  final BehaviorSubject<Date> _yesterday = BehaviorSubject<Date>();
  final BehaviorSubject<Date> _today = BehaviorSubject<Date>();
  final BehaviorSubject<Date> _tomorrow = BehaviorSubject<Date>();



  Stream<Date> get yesterday$ => _yesterday.stream;
  Stream<Date> get today$ => _today.stream;
  Stream<Date> get tomorrow$ => _tomorrow.stream;


  Stream yesterday(month, day) {
    return
      Stream.fromFuture(sl<TodayService>().getDate(month, day));
  }

  Stream today(month, day) {
    return
      Stream.fromFuture(sl<TodayService>().getDate(month, day));
  }
  Stream tomorrow(month, day) {
    return
      Stream.fromFuture(sl<TodayService>().getDate(month, day+1));
  }

  TodayManager(){
     DateTime todayDate = new DateTime.now();
     DateTime yesterdayDate = todayDate.subtract( Duration(days: 1));
     DateTime tomorrowDate = todayDate.add( Duration(days: 1));

    yesterday(yesterdayDate.month, yesterdayDate.day).listen((date) {
      _yesterday.add(date);
    });
    today(todayDate.month, todayDate.day).listen((date) {
      _today.add(date);
    });
    tomorrow(tomorrowDate.month, tomorrowDate.day).listen((date) {
      _tomorrow.add(date);
    });
  }
}