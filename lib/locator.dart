import 'package:estatetial/services/api_service.dart';
import 'package:estatetial/viewmodel/lauches_view_model.dart';
import 'package:estatetial/viewmodel/rocket_view_model.dart';
import 'package:estatetial/viewmodel/upcoming_view_model.dart';
import 'package:get_it/get_it.dart';

import 'package:estatetial/services/navigtion_service.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => UpcomingViewModel());
  locator.registerLazySingleton(() => LaunchesViewModel());
  locator.registerLazySingleton(() => RocketViewModel());
}
