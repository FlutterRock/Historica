import 'package:hackaton_app/model/date.dart';
import 'package:hackaton_app/model/day.dart';
import 'package:hackaton_app/services/today_service.dart';
import 'package:rxdart/rxdart.dart';

import '../service_locator.dart';

class TodayManager{
  final BehaviorSubject<Date> _yesterday = BehaviorSubject<Date>();
  final BehaviorSubject<Date> _today = BehaviorSubject<Date>();
  final BehaviorSubject<Date> _tomorrow = BehaviorSubject<Date>();
  final BehaviorSubject<Day> _dayToday = BehaviorSubject<Day>();
  final BehaviorSubject<Day> _dayTomorrow = BehaviorSubject<Day>();
  final BehaviorSubject<Day>  _dayYesterday = BehaviorSubject<Day>();
  final BehaviorSubject<DateTime>  _currentDay = BehaviorSubject<DateTime>();



  Stream<Date> get yesterday$ => _yesterday.stream;
  Stream<Date> get today$ => _today.stream;
  Stream<Date> get tomorrow$ => _tomorrow.stream;

  Stream<Day> get dayToday$ => _dayToday.stream;
  Stream<Day> get dayTomorrow$ => _dayTomorrow.stream;
  Stream<Day> get dayYesterday$ => _dayYesterday.stream;

  Stream<DateTime> get currentDay$ => _currentDay.stream;

  Sink<DateTime>  get inRequest => _currentDay.sink;


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
      Stream.fromFuture(sl<TodayService>().getDate(month, day));
  }

  TodayManager(){
     _currentDay.listen((todayDate) {
       DateTime yesterdayDate = todayDate.subtract( Duration(days: 1));
       DateTime tomorrowDate = todayDate.add( Duration(days: 1));

       yesterday(yesterdayDate.month, yesterdayDate.day).listen((date) {
         _yesterday.add(date);
         Day yesterdayValue = Day(day: yesterdayDate.day, month: yesterdayDate.month );
         _dayYesterday.add(yesterdayValue);
       });
       today(todayDate.month, todayDate.day).listen((date) {
         _today.add(date);
         Day todayValue = Day(day: todayDate.day, month: todayDate.month );
         _dayToday.add(todayValue);
       });
       tomorrow(tomorrowDate.month, tomorrowDate.day).listen((date) {
         _tomorrow.add(date);
         Day tomorrowValue = Day(day: tomorrowDate.day, month: tomorrowDate.month );
         _dayTomorrow.add(tomorrowValue);
       });
     });
  }
}