import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stacked_example_app/datamodels/api_response_mode.dart';
import 'home_http_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HttpHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
      viewModelBuilder: () => HomeScreenViewModel(),
      builder: (context, model, child) => Scaffold(
          body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            appBar: buildAppBar(),
            body: buildBody(model),
            floatingActionButton: buildFloatingActionButton(model),
          ),
        ),
      )),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Networking Like a Pro"),
    );
  }

  Widget buildBody(viewModel) {
    /// building our UI
    /// notice we are observing viewModel.apiResponseModel
    /// Hence buildDataWidget will rebuild when apiResponse changes in ViewModel
    return Container(child: Center(child: buildDataWidget(viewModel)));
  }

  FloatingActionButton buildFloatingActionButton(viewModel) {
    return FloatingActionButton(
      child: viewModel.isLoading
          ? CircularProgressIndicator(
              backgroundColor: Colors.white,
            )
          : Icon(Icons.cloud_download),
      tooltip: "Get Data from API",

      /// Calling our viewModel function
      onPressed: () => viewModel.getDataFromAPI(),
    );
  }

  buildDataWidget(viewModel) {
    APIResponseModel apiResponseModel = viewModel.apiResponseModel;

    if (apiResponseModel == null)
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "${viewModel.messageToShow}",
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
      );
    else {
      return Text(
        "Total Cases : ${apiResponseModel.cases}\n"
        "Today's Cases : ${apiResponseModel.todayCases}\n"
        "Total Deaths : ${apiResponseModel.deaths}\n"
        "Today's Deaths : ${apiResponseModel.todayDeaths}\n"
        "Total Recovered : ${apiResponseModel.recovered}\n"
        "Active Cases : ${apiResponseModel.active}\n"
        "Critical Cases : ${apiResponseModel.critical}\n"
        "Cases per million: ${apiResponseModel.casesPerOneMillion}\n"
        "Deaths per million: ${apiResponseModel.deathsPerOneMillion}\n"
        "Total Tests Done: ${apiResponseModel.tests}\n"
        "Affected countires : ${apiResponseModel.affectedCountries}\n",
        style: TextStyle(fontSize: 18),
      );
    }
  }
}
