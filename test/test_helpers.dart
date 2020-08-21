import 'package:mockito/mockito.dart';
import 'package:stacked_example_app/app/locator.dart';
import 'package:stacked_example_app/datamodels/address.dart';
import 'package:stacked_example_app/services/permissions_service.dart';
import 'package:stacked_example_app/services/shared_preferences_service.dart';
import 'package:stacked_example_app/system/app_database.dart';
import 'package:stacked_services/stacked_services.dart';

class SharedPreferencesServiceMock extends Mock implements SharedPreferencesService {}

class NavigationServiceMock extends Mock implements NavigationService {}

class AppDatabaseMock extends Mock implements AppDatabase {}

class PermissionsMock extends Mock implements PermissionsService {}

SharedPreferencesService getAndRegisterSharedPreferencesMock({
  bool hasUser = true,
}) {
  _removeRegistrationIfExists<SharedPreferencesService>();

  var service = SharedPreferencesServiceMock();
  when(service.hasUser).thenReturn(hasUser);

  locator.registerSingleton<SharedPreferencesService>(service);
  return service;
}

NavigationService getAndRegisterNavigationServiceMock() {
  _removeRegistrationIfExists<NavigationService>();

  var service = NavigationServiceMock();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

AppDatabaseMock getAndRegisterAppDatabaseMock({bool returnAddress = true}) {
  _removeRegistrationIfExists<AppDatabase>();
  var database = AppDatabaseMock();

  when(database.getCurrentAddress()).thenAnswer((realInvocation) {
    if (returnAddress) return Future.value(Address());
    return null;
  });

  locator.registerSingleton<AppDatabase>(database);
  return database;
}

/*
PermissionsMock getAndRegisterPermissionMock() {
  _removeRegistrationIfExists<AppDatabase>();
  var permission = PermissionsMock();

  when(permission.hasLocationPermission()).thenAnswer((realInvocation) {
    if (returnAddress) return Future.value(Address());
    return null;
  });

  locator.registerSingleton<AppDatabase>(database);
  return database;
}
*/

void _removeRegistrationIfExists<T>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}

void registerServices() {
  getAndRegisterSharedPreferencesMock();
  getAndRegisterNavigationServiceMock();
  getAndRegisterAppDatabaseMock();
  //getAndRegisterPermissionMock();
}

void unregisterServices() {
  locator.unregister<SharedPreferencesService>();
  locator.unregister<NavigationService>();
  locator.unregister<AppDatabase>();
}
