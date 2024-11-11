

import 'package:employee/Config/AppConfig.dart';
import 'package:employee/Config/ColorConfig.dart';
import 'package:employee/Config/SizeConfig.dart';
import 'package:employee/Config/ValueConfig.dart';
import 'package:employee/ReusableComponent/TextWidget/textWidget.dart';
import 'package:flutter/cupertino.dart';

Widget employeeSectionTitle({required double screenWidth,required double screenHeight,required String getTitle}){
  return Container(
    width: screenWidth,
    height: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: SizeConfig().employeeSectionHeight+(screenWidth<screenHeight?0:(SizeConfig().employeeSectionHeight*0.25))),
    padding: EdgeInsets.symmetric(horizontal: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().employeeSectionHorizontalPadding)>20?20: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().employeeSectionHorizontalPadding)),
    alignment: Alignment.centerLeft,
    child: textWidget(getText: getTitle, screenHeight: screenHeight, textSize: SizeConfig().employeeSectionTitleTextSize+(screenWidth<screenHeight?0:(SizeConfig().employeeSectionTitleTextSize*0.25)), textColor: ColorConfig().employeeSectionTitleTextColor, getAlign: TextAlign.start, textStyle: AppConfig().robotoFontMedium, softWrap: true),
  );
}