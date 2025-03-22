import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:gym_swat/core/config/app_config.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/utils/local_preferences.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 401:
        return json.decode(response.body);
      case 400:
        throw Exception('Bad request: ${response.body}');
      case 403:
        throw Exception('Unauthorized: ${response.body}');
      case 500:
        throw Exception('Server error: ${response.body}');
      default:
        throw Exception('Unexpected error: ${response.body}');
    }
  }

  /// GET request (token optional)
  Future<dynamic> getApi({
    String? endPoint,
    String? fullApiUrl,
    bool requiresToken = false,
  }) async {
    String url = fullApiUrl ?? '${AppConfig.baseURL}$endPoint';
    debugPrint(fullApiUrl ?? '${AppConfig.baseURL}$endPoint');
    Map<String, String>? headers = requiresToken ? await _getHeaders() : null;

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      return _handleResponse(response);
    } on SocketException {
      throw Exception('No Internet connection');
    } on TimeoutException {
      throw Exception('Request timeout');
    } catch (e) {
      throw Exception('Failed to get data: $e');
    }
  }

  /// POST request (token optional)
  Future<dynamic> postApi({
    required String endPoint,
    required dynamic body,
    bool requiresToken = false,
    bool isEncodedData = false,
  }) async {
    String url = '${AppConfig.baseURL}$endPoint';
    Map<String, String>? headers = requiresToken
        ? await _getHeaders()
        : {'Content-Type': 'application/json'};

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: isEncodedData ? jsonEncode(body) : body,
      );
      return _handleResponse(response);
    } on SocketException {
      throw Exception('No Internet connection');
    } on TimeoutException {
      throw Exception('Request timeout');
    } catch (e) {
      throw Exception('Failed to post data: $e');
    }
  }

  /// Helper function to get headers with token (if available)
  Future<Map<String, String>> _getHeaders() async {
    var token = LocalPreferenceService.instance.getToken();
    if (token == "") throw Exception('Token not found');

    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}
