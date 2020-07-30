import 'package:covid19_tracker/Services/networking.dart';

const covidTrackingUSURL = 'https://covidtracking.com/api/v1/us/current.json';
const covidTrackingStatesURL = 'https://covidtracking.com/api/v1/states';

class CovidTracking {
  Future<dynamic> getUSData() async {
    NetworkHelper networkHelper = NetworkHelper(url: '$covidTrackingUSURL');

    var usData = await networkHelper.getData();
    return usData;
  }

  Future<dynamic> getStateData(String selectedState) async {
    NetworkHelper networkHelper = NetworkHelper(
        url: '$covidTrackingStatesURL/$selectedState/current.json');

    var stateData = await networkHelper.getData();
    return stateData;
  }
}
