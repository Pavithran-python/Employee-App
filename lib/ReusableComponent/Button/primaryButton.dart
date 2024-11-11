

import 'package:employee/Config/AppConfig.dart';
import 'package:employee/Config/ColorConfig.dart';
import 'package:employee/Config/SizeConfig.dart';
import 'package:employee/Config/ValueConfig.dart';
import 'package:employee/ReusableComponent/TextWidget/textWidget.dart';
import 'package:flutter/material.dart';

ElevatedButton primaryButton({required double screenWidth,required double screenHeight,required double buttonWidth,required double buttonHeight,required double buttonRadius,required String buttonText,required Function(bool) buttonPressedFunction}){
  return ElevatedButton(
    onPressed: (){
      buttonPressedFunction(true);
    },
    style: ElevatedButton.styleFrom(
      elevation: 0,
      alignment: Alignment.center,
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      foregroundColor: ColorConfig().primaryButtonForegroundColor,
      backgroundColor: ColorConfig().primaryButtonBackgroundColor,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      fixedSize: Size(ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: buttonWidth), ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: buttonHeight+(screenWidth<screenHeight?0:(buttonHeight*0.25))),),
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: buttonRadius)>8?8:ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: buttonRadius))),),
    ),
    child: textWidget(getText: buttonText, screenHeight: screenHeight, textSize: SizeConfig().primaryButtonTextSize+(screenWidth<screenHeight?0:(SizeConfig().primaryButtonTextSize*0.25)), textColor: ColorConfig().primaryButtonTextColor, getAlign: TextAlign.center, textStyle: AppConfig().robotoFontMedium, softWrap: true),
  );
}