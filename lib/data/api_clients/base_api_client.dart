import 'dart:convert';

import 'package:chat_app/data/api_clients/api_urls.dart';
import 'package:chat_app/models/base_models/base_entity_response.dart';
import 'package:http/http.dart' as http;

abstract class BaseApiClient {
  String baseApiUrl = ApiUrls.baseApiUrl;

  Future<BaseEntityResponse<String>> postRequest({
    required String endpointUrl,
    required dynamic data,
  }) async {
    try {
      var url = Uri.parse(baseApiUrl + endpointUrl);
      var headers = await _getRequestHeaders();
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(data),
      );
      var apiResponse = BaseEntityResponse<String>(
        entity: response.body,
        isSuccess: response.statusCode >= 200 && response.statusCode < 300,
        message: "",
        apiStatusCode: response.statusCode,
      );
      return apiResponse;
    } catch (e) {
      return BaseEntityResponse(
        entity: null,
        isSuccess: false,
        apiStatusCode: 500,
        message: e.toString(),
      );
    }
  }

  Future<BaseEntityResponse<String>> getRequest({
    required String endpointUrl,
  }) async {
    try {
      var url = Uri.parse(baseApiUrl + endpointUrl);
      var headers = await _getRequestHeaders();
      var response = await http.get(url, headers: headers);

      var apiResponse = BaseEntityResponse(
        entity: response.body,
        isSuccess: response.statusCode >= 200 && response.statusCode < 300,
        apiStatusCode: response.statusCode,
        message: "",
      );
      return apiResponse;
    } catch (e) {
      return BaseEntityResponse(
        entity: null,
        isSuccess: false,
        apiStatusCode: 500,
        message: e.toString(),
      );
    }
  }

  Future<BaseEntityResponse<String>> deleteRequest({
    required String endpointUrl,
  }) async {
    try {
      var url = Uri.parse(baseApiUrl + endpointUrl);
      var headers = await _getRequestHeaders();
      var response = await http.delete(url, headers: headers);
      var apiResponse = BaseEntityResponse(
        entity: response.body,
        isSuccess: response.statusCode >= 200 && response.statusCode < 300,
        apiStatusCode: response.statusCode,
        message: "",
      );
      return apiResponse;
    } catch (e) {
      return BaseEntityResponse(
        entity: null,
        isSuccess: false,
        apiStatusCode: 500,
        message: e.toString(),
      );
    }
  }

  Future<Map<String, String>> _getRequestHeaders() async {
    Map<String, String> headers = {
      "Content-Type": "application/json; charset= UTF-8",
    };
    headers["Authorization"] =
        "Barer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwicm9sZXMiOlsiU1VQRVJfQURNSU4iXSwibmFtZSI6IlN1cGVyIEFkbWluIiwiaWF0IjoxNzc5MjE5MjcxLCJleHAiOjE3NzkyMjI4NzF9.IvO6TUUXs-DxEA4Jf-nw3AlnNw-gehazu4cjPVtLp44";
    return headers;
  }
}
