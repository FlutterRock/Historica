import 'package:get_it/get_it.dart';
import 'package:hackaton_app/managers/today_manager.dart';
import 'package:hackaton_app/services/today_service.dart';

// ambient variable to access the service locator
final sl = GetIt.instance;

void setUpServiceLocator() {
  // register services
  sl.registerLazySingleton<TodayService>(() => TodayServiceImplementation());

  // register managers
  sl.registerLazySingleton<TodayManager>(() => TodayManager());
}

