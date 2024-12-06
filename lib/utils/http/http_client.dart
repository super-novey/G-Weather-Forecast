import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpHelper {
  static const String _baseUrl = "https://api.weatherapi.com/v1";

  static const String _apiKey = "586920fbb93048d78c0130822240612";

  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response =
        await http.get(Uri.parse('$_baseUrl/$endpoint&key=$_apiKey'));
    return _handleResponse(response);
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.body);
    }
  }
}
