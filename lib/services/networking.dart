import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      print(jsonDecode(data));
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future postData(String body) async {
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    if (response.statusCode == 200) {
      String data = response.body;
      print(jsonDecode(data));
      return jsonDecode(data);
    } else {
      print(response);
    }
  }
}
