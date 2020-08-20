import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_example_app/ui/views/startupview/startup_viewmodel.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text(model.title),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => model.navigateToHome(),
        ),
      ),
      viewModelBuilder: () => StartUpViewModel(),
    );
  }
}
