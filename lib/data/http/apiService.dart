import 'dart:convert';
import 'package:http/http.dart' as http;

class API {
  String apiUrl = 'https://together-buzzard-ready.ngrok-free.app/api';

  Future<http.Response> postRequest({
    required String route,
    required Map<String, String> data,
  }) async {
    String url = apiUrl + route;

    return await http.post(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }

  Future<http.Response> getPost({
    required String route,
    required String? token,
    required Map<String, String> data,
  }) async {
    String url = apiUrl + route;

    return await http.post(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
  }

  Future<http.Response> postData({
    required String route,
    required String? token,
    required Map<String, Object> data,
  }) async {
    String url = apiUrl + route;

    // print(jsonEncode(data));
    return await http.post(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: {
        // 'Content-type': 'multipart/form-data',
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
  }

  Future<http.Response> deleteData({
    required String route,
    required String? token,
  }) async {
    String url = apiUrl + route;

    return await http.post(
      Uri.parse(url),
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
  }
}
