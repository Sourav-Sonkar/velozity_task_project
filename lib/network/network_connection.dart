import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:velozity_project/network/models/login_response.dart';
import 'package:velozity_project/network/models/restaurant_list.dart';

import 'models/request_status.dart';

class NetworkConnection {
  static const _baseUrl = "zippy-server-1.herokuapp.com";
  late final http.Client _httpClient;

  NetworkConnection({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();
  Map<String, String> _getHeaders(String token) => {'accessToken': token};

  Future<RequestStatus<LoginResponse?>> login(
      String phoneNumber, String password) async {
    try {
      final loginUri = Uri.https(_baseUrl, '/auth/login');
      final response = await _httpClient.post(loginUri,
          body: {"phoneNumber": phoneNumber, "password": password});
      if (response.statusCode == 200) {
        return RequestStatus(RequestStatus.SUCCESS, "",
            LoginResponse.fromJson(json.decode(response.body)));
      } else {
        return RequestStatus(
            RequestStatus.FAILURE,
            json.decode(response.body)['error_msg'] ?? "Something went wrong",
            null);
      }
    } catch (e) {
      return RequestStatus.SOMETHING_WENT_WRONG;
    }
  }

  Future<RequestStatus<RestaurantList?>> getRestaurants(
      String token, int fromCount) async {
    try {
      final restaurantsUri = Uri.https(
          _baseUrl, '/restaurant', {"from": fromCount.toString(), "size": "5"});
      final response =
          await _httpClient.get(restaurantsUri, headers: _getHeaders(token));
      if (response.statusCode == 200) {
        return RequestStatus(RequestStatus.SUCCESS, "",
            RestaurantList.fromJson(json.decode(response.body)));
      } else {
        return RequestStatus(
            RequestStatus.FAILURE,
            json.decode(response.body)['error_msg'] ?? "Something went wrong",
            null);
      }
    } catch (e) {
      return RequestStatus.SOMETHING_WENT_WRONG;
    }
  }
}
