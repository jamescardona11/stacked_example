import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_example_app/ui/views/validation_example/validation_example_viewmodel.dart';

class ValidationExampleView extends StatelessWidget {
  const ValidationExampleView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ValidationExampleViewModel>.reactive(
      builder: (context, model, child) => Scaffold(),
      viewModelBuilder: () => ValidationExampleViewModel(),
    );
  }
}
