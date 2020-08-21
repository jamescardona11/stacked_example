import 'package:flutter/material.dart';
import 'package:stacked_example_app/app/router.gr.dart' as RouterGr;
import 'package:stacked_example_app/ui/views/futureexample/future_example_view.dart';
import 'package:stacked_example_app/ui/views/futureexample/future_example_viewmodel.dart';
import 'package:stacked_example_app/ui/views/home/home_view.dart';
import 'package:stacked_example_app/ui/views/partialbuild/partial_builds_view.dart';
import 'package:stacked_example_app/ui/views/reactiveexample/reactive_example_view.dart';
import 'package:stacked_example_app/ui/views/streamexample/stream_example_view.dart';
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
      home: HomeView(),
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
