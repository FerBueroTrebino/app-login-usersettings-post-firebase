import 'package:moneda_par_app_dev/services/authentication_service.dart';
import 'package:moneda_par_app_dev/services/firestore_service.dart';
import 'package:get_it/get_it.dart';
import 'package:moneda_par_app_dev/services/navigation_service.dart';
import 'package:moneda_par_app_dev/services/dialog_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
}
