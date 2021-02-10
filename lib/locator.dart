import 'package:get_it/get_it.dart';

import 'package:estatetial/services/navigtion_service.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
