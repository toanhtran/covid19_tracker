import 'package:covid19_tracker/Services/networking.dart';

const covidTrackingUSURL = 'https://covidtracking.com/api/v1/us/current.json';
const covidTrackingStatesURL = 'https://covidtracking.com/api/v1/states';

/// Specify which URL to send to the networking service for data retrieval
class CovidTracking {
  Future<dynamic> getUSData() async {
    try {
      NetworkHelper networkHelper = NetworkHelper(url: '$covidTrackingUSURL');

      var usData = await networkHelper.getUSData();
      return usData;
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<dynamic> getStateData(String selectedState) async {
    try {
      NetworkHelper networkHelper = NetworkHelper(
          url: '$covidTrackingStatesURL/$selectedState/current.json');

      var stateData = await networkHelper.getStateData();
      return stateData;
    } on Exception catch (e) {
      print(e);
    }
  }
}
