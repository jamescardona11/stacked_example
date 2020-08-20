import 'package:stacked/stacked.dart';
import 'package:stacked_example_app/app/locator.dart';
import 'package:stacked_example_app/app/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

class StartUpViewModel extends BaseViewModel {
  String _title = 'Startup View';
  final NavigationService _navigationService = locator<NavigationService>();

  String get title => _title;

  Future navigateToHome() async {
    await _navigationService.navigateTo(Routes.homeView);
  }
}
