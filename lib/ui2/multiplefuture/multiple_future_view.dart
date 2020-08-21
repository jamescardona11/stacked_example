import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_example_app/ui2/multiplefuture/multiple_future_viewmodel.dart';

class MultipleFuturesExampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MultipleFuturesExampleViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      color: Colors.yellow,
                      // Show busy for number future until the data is back or has failed
                      child: model.fetchingNumber ? CircularProgressIndicator() : Text(model.fetchedNumber.toString()),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      color: Colors.red,
                      // Show busy for string future until the data is back or has failed
                      child: model.fetchingString ? CircularProgressIndicator() : Text(model.fetchedString),
                    ),
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => MultipleFuturesExampleViewModel());
  }
}
