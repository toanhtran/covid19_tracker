import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> statesList = [
  'ak',
  'al',
  'ar',
  'az',
  'ca',
  'co',
  'ct',
  'dc',
  'de',
  'fl',
  'ga',
  'hi',
  'ia',
  'id',
  'il',
  'in',
  'ks',
  'ky',
  'la',
  'ma',
  'md',
  'me',
  'mi',
  'mn',
  'mo',
  'ms',
  'mt',
  'nc',
  'nd',
  'ne',
  'nh',
  'nj',
  'nm',
  'nv',
  'ny',
  'oh',
  'ok',
  'or',
  'pa',
  'pr',
  'ri',
  'sc',
  'sd',
  'tn',
  'tx',
  'ut',
  'us',
  'va',
  'wa',
  'wi',
  'wv',
  'wy',
];

const List<String> currentData = [
  'positive',
  'positiveIncrease',
  'hospitalizedCurrently',
  'hospitalizedCumulative',
  'inIcuCurrently',
  'onVentilatorCurrently',
  'death',
  'deathIncrease',
  'state',
  'lastUpdateEt',
];

/*
 Current API from The COVID Tracking Project, https://covidtracking.com/
 The project is currently working on a new version of the API. V1 of the API
 will stop receiving updates as of 10/1/2020 and will remain online until 1/1/2021.

 The new API will be a standardized JSON API.
*/
const coronaVirusAPIURL = 'https://covidtracking.com/api/v1/states/';


class StateData {
  Future getStateData(String selectedState) async {

    Map<String, String> stateData = {};

    for (String current in currentData) {
      String requestURL = '$coronaVirusAPIURL/$selectedState/current.json';
      http.Response response = await http.get(requestURL);

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var lastResult = decodedData[current];

        stateData[current] = lastResult.toString();
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return stateData;
  }
}