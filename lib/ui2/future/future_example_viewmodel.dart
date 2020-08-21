import 'package:stacked/stacked.dart';

class FutureExampleViewModel extends FutureViewModel<String> {
  @override
  Future<String> get future => getDataFromServer();

  Future<String> getDataFromServer() async {
    await Future.delayed(const Duration(seconds: 3));
    return 'This is fetched from everywhere';
  }

  @override
  Future<String> futureToRun() => getDataFromServer();
}
