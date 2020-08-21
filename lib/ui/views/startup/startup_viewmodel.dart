import 'package:stacked/stacked.dart';
import 'package:stacked_example_app/app/locator.dart';
import 'package:stacked_example_app/app/router.gr.dart';
import 'package:stacked_example_app/services/shared_preferences_service.dart';
import 'package:stacked_example_app/system/app_database.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _sharedPreferencesService = locator<SharedPreferencesService>();
  final _navigationService = locator<NavigationService>();
  final _database = locator<AppDatabase>();

  Future initialise() async {
    var hasUser = _sharedPreferencesService.hasUser;

    if (hasUser) {
      var currentAddress = await _database.getCurrentAddress();

      if (currentAddress == null) {
        await _navigationService.replaceWith(Routes.addressSelectionView);
      } else {
        await _navigationService.replaceWith(Routes.homeView);
      }
    }
  }
}
