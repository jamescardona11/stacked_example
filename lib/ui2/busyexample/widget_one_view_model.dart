import 'package:stacked/stacked.dart';

class WidgetOneViewModel extends BaseViewModel {
  Human _currentHuman;
  Human get currentHuman => _currentHuman;

  void setBusyOnProperty() {
    setBusyForObject(_currentHuman, true);
    // Fetch updated human data
    setBusyForObject(_currentHuman, false);
  }

  void setModelBusy() {
    setBusy(true);
    // Do things here
    setBusy(false);
  }

  Future longUpdateStuff() async {
    // Sets busy to true before starting future and sets it to false after executing
    // You can also pass in an object as the busy object. Otherwise it'll use the model
    var result = await runBusyFuture(updateStuff());
  }

  Future updateStuff() {
    return Future.delayed(const Duration(seconds: 3));
  }
}

// Model
class Human {
  final String name;
  final String surname;

  Human({this.name, this.surname});
}
