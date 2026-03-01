import 'package:flutter/material.dart';
import 'package:mvvm_app/res/components/round_button.dart';
import 'package:mvvm_app/utils/general_utils.dart' show GeneralUtils;
import 'package:mvvm_app/utils/routes/routes_name.dart';
import 'package:mvvm_app/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
 TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode? get emailFocusNode => null;
  FocusNode? get passwordFocusNode => null;

  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
      final authViewmodel=Provider.of<AuthViewmodel>(context);

    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                focusNode: emailFocusNode,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Enter email',
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                onFieldSubmitted: (value) {
                  GeneralUtils.fieldFocusChange(
                    context,
                    emailFocusNode!,
                    passwordFocusNode!,
                  );
                },
              ),
              const SizedBox(height: 20),
              ValueListenableBuilder(
                valueListenable: _obscurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    obscureText: _obscurePassword.value,
                    focusNode: passwordFocusNode,
                    obscuringCharacter: '*',
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: InkWell(
                        onTap: () {
                          _obscurePassword.value = !_obscurePassword.value;
                        },
                        child: Icon(
                          _obscurePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      hintText: 'Enter password',
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  );
                },
              ),
              SizedBox(height: height * 0.085),
              RoundButton(
                title: 'Sign Up',
                loading: authViewmodel.signupLoading,
                onPress: () {
                  if (emailController.text.isEmpty) {
                    GeneralUtils.flushBarErrorMessage(
                      'Please enter email',
                      context,
                    );
                  } else if (passwordController.text.isEmpty) {
                    GeneralUtils.flushBarErrorMessage(
                      'Please enter password',
                      context,
                    );
                  } else {
                    Map data={
                      "email":emailController.text.toString(),
                      "password":passwordController.text.toString()
                    };
                    authViewmodel.registerApi(data, context);
                  }
                },
              ),
               SizedBox(height: height * 0.090,),
               InkWell(
                 onTap: () {
                   Navigator.pushNamed(context, RoutesName.login);
                 },
                 child: Text("Already have an account? Login",style: TextStyle(fontSize: 16),))
            ],
          ),
        ),
      ),
    );
  }
}