import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_example_app/app/locator.dart';
import 'package:stacked_example_app/app/router.gr.dart';
import 'package:stacked_example_app/services/shared_preferences_service.dart';
import 'package:stacked_example_app/ui/views/startup/startup_viewmodel.dart';

import '../test_helpers.dart';

void main() {
  group('StartupViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('initialise -', () {
      test('When called should check hasUser on sharedPreferences', () async {
        var sharedPreferences = getAndRegisterSharedPreferencesMock();
        var model = StartupViewModel();
        await model.initialise();
        verify(sharedPreferences.hasUser);
      });
      test('When called should check hasUser on sharedPreferencesService', () async {
        var sharedPreferences = getAndRegisterSharedPreferencesMock();

        var model = StartupViewModel();
        await model.initialise();
        verify(sharedPreferences.hasUser);
      });

      test('When called and hasUser returns true, should get currentAddress from disk', () async {
        var database = getAndRegisterAppDatabaseMock();
        var model = StartupViewModel();
        await model.initialise();
        verify(database.getCurrentAddress());
      });

      test('When hasUser is true and getCurrentAddress returns null, should navigate to addressSelectionViewRoute',
          () async {
        getAndRegisterAppDatabaseMock(returnAddress: false);
        var navigation = getAndRegisterNavigationServiceMock();
        var model = StartupViewModel();
        await model.initialise();
        verify(navigation.replaceWith(Routes.addressSelectionView));
      });

      /*test('Ensure user has permissions', () async {
        getAndRegisterAppDatabaseMock(returnAddress: false);
        var navigation = getAndRegisterNavigationServiceMock();
        var model = StartupViewModel();
        await model.initialise();
        verify(navigation.replaceWith(Routes.addressSelectionView));
      });*/
      /*test('When user dont have permissions for location request',
              () async {
            getAndRegisterAppDatabaseMock(returnAddress: false);
            var navigation = getAndRegisterNavigationServiceMock();
            var model = StartupViewModel();
            await model.initialise();
            verify(navigation.replaceWith(Routes.addressSelectionView));
          });*/
    });
  });
}
