import 'dart:io';
import 'dart:async';

import 'package:http/http.dart';
import 'package:mvvm_app/data/app_exceptions.dart';
import 'package:mvvm_app/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  //get api response
  @override
  Future<dynamic> getResponse(String url) async {
    dynamic responseJson;
    try {
      //api calling
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  //post api response
  @override
  Future<dynamic> postResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      //api calling
      Response response = await post(
        Uri.parse(url),
        body: data,
      ).timeout(Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.body;
        return responseJson;
      case 400:
        throw BadRequestsException(response.body.toString());
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException(
          'Error Occured while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }
}
