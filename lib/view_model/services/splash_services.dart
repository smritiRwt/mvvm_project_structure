import 'package:flutter/material.dart';
import 'package:mvvm_app/model/user_model.dart';
import 'package:mvvm_app/utils/routes/routes_name.dart';
import 'package:mvvm_app/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel?> getUserData()=>UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async{
    getUserData().then((value) async{
      if(value?.token!=null &&  value?.token!="null"){
       await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
        print("User is logged in");
      }else{
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
        print("User is not logged in");
      } 
    }).onError(
      (error, stackTrace){
        print(error.toString());
      }
    );
  }
  

}