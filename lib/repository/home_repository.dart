import 'package:mvvm_app/data/network/base_api_services.dart';
import 'package:mvvm_app/data/network/network_api_service.dart';
import 'package:mvvm_app/model/post_model.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiService();
  Future fetchPosts() async {
    try {
      dynamic response = await _apiServices.getResponse(
          'https://jsonplaceholder.typicode.com/posts');
      return response=PostModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}