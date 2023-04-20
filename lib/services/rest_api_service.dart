import 'package:dio/dio.dart';

class RestAPIService {
  String get getBaseUrl =>
      "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=rum";

  getListDataFromAPI() async {
    final dio = Dio();
    final reponse = await dio.get(getBaseUrl);
    if (reponse.statusCode == 200) {
      return reponse.data;
    }
  }
}

class ResponseData {
  dynamic data;
  int? statusCode;
  ResponseData({
    this.data,
    this.statusCode,
  });
}
