import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends IndexTrackingViewModel {
  String _title = 'Home View';
  String get title => _title;

  void initialize() {
    debugPrint('Initialize Homeview 1');
  }
}
