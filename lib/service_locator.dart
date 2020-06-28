import 'package:get_it/get_it.dart';
import 'package:hackaton_app/managers/today_manager.dart';
import 'package:hackaton_app/services/today_service.dart';

// ambient variable to access the service locator
final sl = GetIt.instance;

void setUpServiceLocator() {
  // register services
  sl.registerLazySingleton<TodayService>(() => TodayServiceImplementation());
  /*sl.registerLazySingleton<LocationService>(() => LocationServiceImplementation());
  sl.registerLazySingleton<PrayerService>(() => PrayerServiceImplementation());
  sl.registerLazySingleton<FawaidService>(() => FawaidServiceImplementation());*/

  // register managers
  sl.registerLazySingleton<TodayManager>(() => TodayManager());
  /*sl.registerLazySingleton<LocationManager>(() => LocationManager());
  sl.registerLazySingleton<PrayerManager>(() => PrayerManager());
  sl.registerLazySingleton<FawaidManager>(() => FawaidManager());
  sl.registerLazySingleton<NotificationManager>(() => NotificationManager());*/
}

