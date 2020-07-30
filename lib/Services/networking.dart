import 'package:http/http.dart' as http;
import 'dart:convert';

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

class NetworkHelper {
  NetworkHelper({this.url});

  final String url;

  Future getData() async {
    Map<String, String> data = {};

    for (String current in currentData) {
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var lastResult = decodedData[current];

        data[current] = lastResult.toString();
      } else {
        print(response.statusCode);
      }
    }
    return data;
  }
}
