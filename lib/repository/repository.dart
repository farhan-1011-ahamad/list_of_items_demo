import 'package:rest_api_flutter_demo/services/rest_api_service.dart';
import 'package:rest_api_flutter_demo/source/model/model.dart';

class DataRepository {
  RestAPIService restAPIService = RestAPIService();

  Future<DrinkResponse> getDrinkResponse(String? searchParam) async {
    var headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    var response = await restAPIService.getRequest( searchParam, headers);
    return DrinkResponse.fromJson(response);
  }
}
