

import 'package:employee/Config/AppConfig.dart';
import 'package:employee/Config/ColorConfig.dart';
import 'package:employee/Config/SizeConfig.dart';
import 'package:employee/Config/ValueConfig.dart';
import 'package:employee/ReusableComponent/TextWidget/textWidget.dart';
import 'package:flutter/material.dart';


ElevatedButton secondaryButton({required double screenWidth,required double screenHeight,required double buttonWidth,required double buttonHeight,required double buttonRadius,required String buttonText,required Function(bool) buttonPressedFunction}){
  return ElevatedButton(
    onPressed: (){
      buttonPressedFunction(true);
    },
    style: ElevatedButton.styleFrom(
      elevation: 0,
      alignment: Alignment.center,
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      foregroundColor: ColorConfig().secondaryButtonForegroundColor,
      backgroundColor: ColorConfig().secondaryButtonBackgroundColor,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      fixedSize: Size(ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: buttonWidth), ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: buttonHeight),),
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: buttonRadius))),),
    ),
    child: textWidget(getText: buttonText, screenHeight: screenHeight, textSize:SizeConfig().secondaryButtonTextSize, textColor: ColorConfig().secondaryButtonTextColor, getAlign: TextAlign.center, textStyle: AppConfig().robotoFontMedium, softWrap: true),
  );
}