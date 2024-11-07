import 'package:employee/Config/TextConfig.dart';
import 'package:employee/ReusableComponent/WidgetUI/messageBoxWidget.dart';
import 'package:flutter/material.dart';

messageBox({required BuildContext context,required double screenWidth,required double screenHeight,required String getMessage,required String getActionText,required Function(bool) undoCallBackFunction,}){
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  final snackBar = messageBoxWidget(screenWidth: screenWidth, screenHeight: screenHeight, getMessage: getMessage,getActionText: getActionText,getCallBackFunction: (isClick){
    if(isClick){
      undoCallBackFunction(true);
    }
  });
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}