import 'package:stacked_example_app/datamodels/networking_response.dart';

import 'NetworkRepo.dart';

class HomeScreenRepository {
  /// ViewModel calls its Repository to getLatestStatsData
  /// The Repository will take care of getting the data from thr right source
  /// Only HomeRepository knows that it has to call NetworkRepo()
  /// ViewModel doesn't care if its coming from API or Offline Cache
  Future<NetworkingResponse> getLatestStatsData() {
    return NetworkRepo().getLatestDataFromAPI();
  }
}
