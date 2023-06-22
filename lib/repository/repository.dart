import 'package:list_of_items_demo/model/item.dart';
import 'package:list_of_items_demo/services/items_service.dart';

class DataRepository {
  RestAPIService restAPIService = RestAPIService();

  Future<ItemResponse> getItems(String? searchParam) async {
    var headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    var response = await restAPIService.getRequest( searchParam, headers);
    return ItemResponse.fromJson(response);
  }
}
