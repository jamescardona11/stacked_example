import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_example_app/ui2/busyexample/widget_one_view_model.dart';

class WidgetOne extends StatelessWidget {
  const WidgetOne({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WidgetOneViewModel>.reactive(
      viewModelBuilder: () => WidgetOneViewModel(),
      builder: (context, model, child) => GestureDetector(
        onTap: () => model.longUpdateStuff(),
        child: Container(
            width: 100,
            height: 100,
            // Use isBusy to check if the model is set to busy
            color: model.isBusy ? Colors.green : Colors.red,
            alignment: Alignment.center,
            // A bit silly to pass the same property back into the viewmodel
            // but here it makes sense
            child: model.busy(model.currentHuman)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                  )),
      ),
    );
  }
}
