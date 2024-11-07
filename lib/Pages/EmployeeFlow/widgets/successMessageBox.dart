
import 'package:employee/ReusableComponent/WidgetUI/messageBoxWidget.dart';
import 'package:flutter/material.dart';

successMessageBox({required BuildContext context,required double screenWidth,required double screenHeight,required String getMessage,required String getActionText}){
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  final snackBar = messageBoxWidget(screenWidth: screenWidth, screenHeight: screenHeight, getMessage: getMessage,getActionText: getActionText,getCallBackFunction: (isClick){
    if(isClick){
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }
  });
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}