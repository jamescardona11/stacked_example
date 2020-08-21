import 'package:flutter/material.dart';
import 'package:stacked_example_app/main.dart';
import 'package:stacked_example_app/ui/views/home/home_view.dart';

class MainUIView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI 1'),
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
  };
}
