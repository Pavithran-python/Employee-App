

import 'package:employee/Config/AppConfig.dart';
import 'package:employee/Config/ColorConfig.dart';
import 'package:employee/Config/SizeConfig.dart';
import 'package:employee/Config/ValueConfig.dart';
import 'package:employee/ReusableComponent/TextWidget/textWidget.dart';
import 'package:flutter/cupertino.dart';

Widget employeeSectionTitle({required double screenWidth,required double screenHeight,required String getTitle}){
  return Container(
    width: screenWidth,
    height: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: SizeConfig().employeeSectionHeight),
    padding: EdgeInsets.symmetric(horizontal: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().employeeSectionHorizontalPadding)),
    alignment: Alignment.centerLeft,
    child: textWidget(getText: getTitle, screenHeight: screenHeight, textSize: SizeConfig().employeeSectionTitleTextSize, textColor: ColorConfig().employeeSectionTitleTextColor, getAlign: TextAlign.start, textStyle: AppConfig().robotoFontMedium, softWrap: true),
  );
}