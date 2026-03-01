import 'package:flutter/material.dart';
import 'package:mvvm_app/utils/routes/routes.dart';
import 'package:mvvm_app/utils/routes/routes_name.dart';
import 'package:mvvm_app/view/login_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LoginScreen(),
      initialRoute:RoutesName.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
