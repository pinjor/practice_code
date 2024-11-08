import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:task_manager/data/models/network_response.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest({required String url}) async {
    try {
      debugPrint(url);
      Uri uri = Uri.parse(url);

      final Response response = await get(uri);
      printresponse(url, response);

      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);
        return NetworkResponse(
          issuccess: true,
          statusCode: response.statusCode,
          responseData: decodeData,
        );
      } else {
        return NetworkResponse(
          issuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
        issuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  static void printresponse(String url, Response response) {
    debugPrint(
        'URL :$url\n responsecode : ${response.statusCode}\n, body: ${response.body}');
  }

  static Future<NetworkResponse> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      debugPrint(url);
      Uri uri = Uri.parse(url);

      final Response response = await post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      printresponse(url, response);

      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);
        return NetworkResponse(
          issuccess: true,
          statusCode: response.statusCode,
          responseData: decodeData,
        );
      } else {
        return NetworkResponse(
          issuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
        issuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }
}
