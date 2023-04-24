import 'dart:developer';

import 'package:dio/dio.dart';

class RestAPIService {
  String get getBaseUrl =>
      "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=";

  Future<dynamic> getRequest([String? searchItem, dynamic headers]) async {
    try {
      final dio = Dio();
      String requestUrl = getBaseUrl + (searchItem ?? "");
      dio.options.headers = headers;
      log(requestUrl, name: "Request Url");
      final response = await dio.get(requestUrl);
      if (response.statusCode == 200) {
        return response.data;
      } else {
      log(response.statusCode.toString(), name: "Status Code");
      log(response.data.toString(), name: "Response Data");
      }
    } catch (e) {
      log(e.toString(), name: "Error in Network Service");
    }
  }
}