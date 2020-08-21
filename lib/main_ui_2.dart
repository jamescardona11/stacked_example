import 'package:flutter/material.dart';
import 'package:stacked_example_app/main.dart';
import 'package:stacked_example_app/ui2/busyexample/widget_one.dart';
import 'package:stacked_example_app/ui2/home/home_view.dart';

import 'ui2/nonreactiveexample/home_view_multiples_wigets.dart';

class MainUI2View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI 2'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: convertMapToList(context, screens),
        ),
      ),
    );
  }

  final Map<String, Widget> screens = {
    'Home View': HomeView(),
    'Multiples Widgets (NonReactive)': HomeViewMultipleWidgets(),
    'Busy Widget': WidgetOne(),
  };
}
