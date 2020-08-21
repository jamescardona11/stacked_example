import 'package:injectable/injectable.dart';
import 'package:stacked_example_app/datamodels/address.dart';

@lazySingleton
class AppDatabase {
  Future<Address> getCurrentAddress() {}
}
