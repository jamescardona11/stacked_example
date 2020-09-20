import 'package:flutter/material.dart';
import 'package:stacked_example_app/app/router.gr.dart' as RouterGr;
import 'package:stacked_example_app/main_ui.dart';
import 'package:stacked_example_app/main_ui_2.dart';
import 'package:stacked_example_app/ui/views/dialog_example/setup_dialog_ui.dart';
import 'package:stacked_example_app/ui2/home/home_view.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/locator.dart';
import 'main_ui_3.dart';

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
      home: _NavigatorIntern(),
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}

class _NavigatorIntern extends StatelessWidget {
  final Map<String, Widget> screens = {
    'UI': MainUIView(),
    'UI 2': MainUI2View(),
    'UI 3': MainUI3View(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: convertMapToList(context, screens),
        ),
      ),
    );
  }
}

List<Widget> convertMapToList(BuildContext context, screens) {
  List<Widget> listItems = [];
  screens.forEach(
    (key, value) => listItems.add(
      Card(
        child: ListTile(
          title: Text(
            key,
            style: TextStyle(),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => value));
          },
        ),
      ),
    ),
  );

  return listItems;
}
