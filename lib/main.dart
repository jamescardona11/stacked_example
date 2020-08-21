import 'package:flutter/material.dart';
import 'package:stacked_example_app/app/router.gr.dart' as RouterGr;
import 'package:stacked_example_app/ui/views/dialog_example/setup_dialog_ui.dart';
import 'package:stacked_example_app/ui/views/futureexample/future_example_view.dart';
import 'package:stacked_example_app/ui/views/futureexample/future_example_viewmodel.dart';
import 'package:stacked_example_app/ui/views/home/home_view.dart';
import 'package:stacked_example_app/ui/views/partialbuild/partial_builds_view.dart';
import 'package:stacked_example_app/ui/views/reactiveexample/reactive_example_view.dart';
import 'package:stacked_example_app/ui/views/streamexample/stream_example_view.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/locator.dart';
import 'ui/views/dialog_example/dialog_example_view.dart';

void main() {
  setupLocator();
  setupDialogUi();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      //onGenerateRoute: RouterGr.Router(),
      home: DialogExampleView(),
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
