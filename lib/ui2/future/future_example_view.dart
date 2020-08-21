import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_example_app/ui2/future/future_example_viewmodel.dart';

class FutureExampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FutureExampleViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          // model will indicate busy until the future is fetched
          child: model.isBusy ? CircularProgressIndicator() : Text(model.data),
        ),
      ),
      viewModelBuilder: () => FutureExampleViewModel(),
    );
  }
}
