import 'package:flutter/material.dart';
import 'package:stacked_example_app/main.dart';
import 'package:stacked_example_app/ui/views/home/home_view.dart';
import 'package:stacked_example_app/ui/views/startupview/startup_view.dart';

import 'ui/views/startup/startup_view.dart';
import 'ui3/httpexample/home_http_view.dart';

class MainUI3View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI 3'),
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
    'HttpExample': HttpHomeView(),
  };
}
