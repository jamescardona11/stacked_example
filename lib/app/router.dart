import 'package:auto_route/auto_route_annotations.dart';
import 'package:stacked_example_app/ui/views/address_selection/address_selection_view.dart';
import 'package:stacked_example_app/ui/views/home/home_view.dart';
import 'package:stacked_example_app/ui/views/startupview/startup_view.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: StartUpView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: AddressSelectionView),
  ],
)
class $Router {}
