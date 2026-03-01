import 'package:flutter/material.dart';
import 'package:mvvm_app/res/colors.dart';

class RoundButton extends StatelessWidget {
   final String title;
  final VoidCallback onPress;
  final bool loading;
  const RoundButton({super.key, required this.title, required this.onPress, required this.loading});
 
  


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          color: ColorsApp.primaryColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child:  Center(child: loading?CircularProgressIndicator(color: ColorsApp.whiteColor,):Text(title,style: TextStyle(color: ColorsApp.whiteColor),)),
      ),
    );
  }
}