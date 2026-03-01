import 'package:flutter/material.dart';
import 'package:mvvm_app/repository/auth_repository.dart';
import 'package:mvvm_app/utils/general_utils.dart';
import 'package:mvvm_app/utils/routes/routes_name.dart';

class AuthViewmodel with ChangeNotifier{
final _myRepo=AuthRepository();

bool _loading=false;
bool get loading=>_loading;

bool _signupLoading=false;
bool get signupLoading=>_signupLoading;

void setSignupLoading(bool value){
  _signupLoading=value;
  notifyListeners();
}

void setLoading(bool value){
  _loading=value;
  notifyListeners();
}

Future<void> loginApi(dynamic data,context)async{
  setLoading(true);
  _myRepo.loginApi(data).then((value){
    setLoading(false);
    GeneralUtils.toastMessage('Login Successfully');
    print(value.toString());
    Navigator.pushReplacementNamed(context, RoutesName.home);
  }).onError((error, stackTrace){
    setLoading(false);
    GeneralUtils.flushBarErrorMessage(error.toString(), context);
    Navigator.pushReplacementNamed(context, RoutesName.home);

    print(error.toString());
  });
  
}

Future<void> registerApi(dynamic data,context)async{
  setLoading(true);
  _myRepo.signupApi(data).then((value){
    setLoading(false);
    GeneralUtils.toastMessage('Register Successfully');
    print(value.toString());
    Navigator.pushNamed(context, RoutesName.home);
  }).onError((error, stackTrace){
    setLoading(false);
    GeneralUtils.flushBarErrorMessage(error.toString(), context);
    Navigator.pushNamed(context, RoutesName.home);

    print(error.toString());
  });
}
}