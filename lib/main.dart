import 'package:flutter/material.dart';
import 'package:stacked_example_app/app/router.gr.dart' as RouterGr;
import 'package:stacked_example_app/ui/views/partialbuild/partial_builds_view.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      //onGenerateRoute: RouterGr.Router(),
      home: PartialBuildsView(),
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
