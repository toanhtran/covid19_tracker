import 'package:http/http.dart' as http;
import 'dart:convert';

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
