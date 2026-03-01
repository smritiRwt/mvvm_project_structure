import 'package:flutter/material.dart';
import 'package:mvvm_app/utils/routes/routes.dart';
import 'package:mvvm_app/utils/routes/routes_name.dart';
import 'package:mvvm_app/view/login_view.dart';
import 'package:mvvm_app/view_model/auth_viewmodel.dart';
import 'package:mvvm_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: 
    [
      ChangeNotifierProvider(create: (context) => AuthViewmodel()),
      ChangeNotifierProvider(create:  (context) => UserViewModel())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LoginView(),
      initialRoute:RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
    ));
  }
}
