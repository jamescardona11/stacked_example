import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_example_app/ui2/home/home_viewmodel.dart';
import 'dart:math';

class HomeViewMultipleWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('Call in Build ${Random().nextInt(15)}');
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, _) => Scaffold(
        floatingActionButton: UpdateTitleButton(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TitleSection(),
            DescriptionSection(),
            //UpdateTitleButton(),
          ],
        ),
      ),
    );
  }
}

class TitleSection extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Row(
      children: <Widget>[
        Text(
          'Title',
          style: TextStyle(fontSize: 20),
        ),
        Container(
          child: Text(model.title),
        ),
      ],
    );
  }
}

class DescriptionSection extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Row(
      children: <Widget>[
        Text(
          'Description',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
        Container(
          child: Text('${model.title} ${Random().nextInt(5)}'),
        ),
      ],
    );
  }
}

class UpdateTitleButton extends ViewModelWidget<HomeViewModel> {
  const UpdateTitleButton({
    Key key,
  }) : super(key: key, reactive: false);

  @override
  Widget build(BuildContext context, model) {
    return FloatingActionButton(
      onPressed: () {
        model.updateTitle();
      },
    );
  }
}
