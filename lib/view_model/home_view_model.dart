import 'package:flutter/material.dart';
import 'package:mvvm_app/data/response/api_response.dart';
import 'package:mvvm_app/model/post_model.dart';
import 'package:mvvm_app/repository/home_repository.dart';

class HomeViewModel extends ChangeNotifier{
  final _myRepo=HomeRepository();
  ApiResponse<List<PostModel>> postList=ApiResponse.loading();
  
  void setMoviesList(ApiResponse<List<PostModel>> response){
    postList=response;
    notifyListeners();
  }

  Future<void> fetchPostApi()async{
    setMoviesList(ApiResponse.loading());
    _myRepo.fetchPosts().then((value){
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}