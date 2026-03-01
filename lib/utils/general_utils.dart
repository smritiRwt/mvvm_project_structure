import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GeneralUtils {
  //toast message
  static void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }


  //fluster toast
  static void flushBarErrorMessage(String message,BuildContext context){
    showFlushbar(context: context, flushbar: Flushbar(
      message: message,
      backgroundColor: Colors.black,

      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      icon: const Icon(Icons.info, color: Colors.white,) ,
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.decelerate,
    )..show(context));
  }

  static void fieldFocusChange(BuildContext context,FocusNode current,FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}