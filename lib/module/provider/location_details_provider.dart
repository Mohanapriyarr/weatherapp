import 'package:flutter/material.dart';
import 'package:weather_app/data/services/api/location_deatils_api.dart';
import 'package:weather_app/module/model/location_details_model.dart';

class LocationDetailsProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  LocationDetailsModel? locationDetails;

  LocationDetailsProvider(String city) {
    initSate(city);
  }

  Future<void> initSate(String city) async {
    setLoading(true);
    await locationDetailsData(city);
    setLoading(false);
  }

  //? loader
  void setLoading(bool loadingStatus) {
    _loading = loadingStatus;
    notifyListeners();
  }

  //? fetch symbol
  Future<void> locationDetailsData(String city) async {
    final response = await locationDetailsApi(city: city);
    if (response == null) return;
    locationDetails = response;
    notifyListeners();
  }
}
