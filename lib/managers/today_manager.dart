import 'package:hackaton_app/model/date.dart';
import 'package:hackaton_app/services/today_service.dart';
import 'package:rxdart/rxdart.dart';

import '../service_locator.dart';

class TodayManager{
  final BehaviorSubject<Date> _today = BehaviorSubject<Date>();

  Stream<Date> get today$ => _today.stream;

  Stream today() {
    return
      Stream.fromFuture(sl<TodayService>().getDate());
  }

  TodayManager(){
    today().listen((date) {
      _today.add(date);
    });
  }
}