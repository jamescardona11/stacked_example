import 'package:flutter/material.dart';
import 'package:stacked_example_app/datamodels/api_response_mode.dart';
import 'package:stacked_example_app/datamodels/networking_response.dart';

import 'home_repository.dart';

class HomeScreenViewModel extends ChangeNotifier {
  HomeScreenViewModel() {
    /// As soon as VM initializes
    /// We want to get the latest data
    getDataFromAPI();
  }

  APIResponseModel apiResponseModel;
  String messageToShow = "";
  bool isLoading = false;

  void getDataFromAPI() async {
    /// Start showing the loader
    isLoading = true;
    notifyListeners();

    /// Wait for response
    NetworkingResponse networkingResponse = await HomeScreenRepository().getLatestStatsData();

    /// We check the type of response and update the required field
    if (networkingResponse is NetworkingResponseData) {
      /// Updating the APIResponseModel when success
      apiResponseModel = networkingResponse.apiResponseModel;
    } else if (networkingResponse is NetworkingException) {
      /// Updating the errorMessage when fails
      messageToShow = networkingResponse.message;
    }

    /// Stop the loader
    isLoading = false;
    notifyListeners();
  }
}
