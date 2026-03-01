import 'package:flutter/material.dart';
import 'package:mvvm_app/utils/general_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: .center,
        children: [
          InkWell(
            onTap: () {
              GeneralUtils.flushBarErrorMessage('Login Successfully', context);
             // GeneralUtils.toastMessage('Login Successfully');
            },
            child: Container(
              height: 50,
              width: 100,
              color: Colors.red,
              child: const Center(child: Text('Login')),
            ),
          )
        ],
      ),
    );
  }
}