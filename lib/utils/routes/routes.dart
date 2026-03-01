import 'package:flutter/material.dart';
import 'package:mvvm_app/utils/routes/routes_name.dart';
import 'package:mvvm_app/view/home_screen.dart';
import 'package:mvvm_app/view/login_Screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final arguments=settings.arguments;
    switch(settings.name){
      case RoutesName.home:
      return MaterialPageRoute(builder:(BuildContext context)=>HomeScreen());
      case RoutesName.login:
      return MaterialPageRoute(builder:(BuildContext context)=>LoginScreen());
      default:
      return MaterialPageRoute(builder: (BuildContext context){
        return Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
      });
      
    }
  }
}