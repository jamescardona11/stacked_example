import 'package:auto_route/auto_route_annotations.dart';
import 'package:stacked_example_app/ui/views/home/home_view.dart';
import 'package:stacked_example_app/ui/views/startupview/startup_view.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: StartUpView),
  ],
)
class $Router {}
