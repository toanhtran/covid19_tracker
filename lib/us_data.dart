import 'dart:convert';
import 'package:http/http.dart' as http;

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
const coronaVirusAPIURL = 'https://covidtracking.com/api/v1/us/current.json';

class USData {
  Future getUSData() async {

    Map<String, String> usData = {};

    for (String current in currentData) {

      String requestURL = '$coronaVirusAPIURL';
      http.Response response = await http.get(requestURL);

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var lastResult = decodedData[current];
        if (lastResult == null) {
          lastResult = 'NA';
        }
        usData[current] = lastResult.toString();
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    print(usData);
    return usData;
  }
}