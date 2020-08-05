import 'package:http/http.dart' as http;
import 'dart:convert';

/// Current API from The COVID Tracking Project, https://covidtracking.com/
/// The project is currently working on a new version of the API. V1 of the API
/// will stop receiving updates as of 10/1/2020 and will remain online until 1/1/2021.
//
/// The new API will be a standardized JSON API.
class NetworkHelper {
  NetworkHelper({this.url});

  final String url;

  Future getUSData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = response.body.toString();
      final jsonData = jsonDecode(data)[0];
      return jsonData;
    } else {
      print(response.statusCode);
    }
  }

  Future getStateData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = response.body.toString();
      final jsonData = jsonDecode(data);
      return jsonData;
    } else {
      print(response.statusCode);
    }
  }
}
