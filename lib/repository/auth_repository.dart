import 'package:mvvm_app/data/network/base_api_services.dart';
import 'package:mvvm_app/data/network/network_api_service.dart';
import 'package:mvvm_app/res/app_urls.dart';

class AuthRepository {
    final BaseApiServices _apiServices=NetworkApiService();

    Future<dynamic> loginApi(dynamic data) async{
      try{
        dynamic response=_apiServices.postResponse(AppUrls.loginUrl
        , data);
        return response;
      }catch(e){
        throw e;
      }
    }

    Future<dynamic> signupApi(dynamic data) async{
      try{
        dynamic response=_apiServices.postResponse(AppUrls.registerUrl
        , data);
        return response;
      }catch(e){
        throw e;
      }
    }
}