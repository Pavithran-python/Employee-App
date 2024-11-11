import 'package:employee/Config/AppConfig.dart';
import 'package:employee/Config/ColorConfig.dart';
import 'package:employee/Config/SizeConfig.dart';
import 'package:employee/Config/TextConfig.dart';
import 'package:employee/Config/ValueConfig.dart';
import 'package:employee/ReusableComponent/Image/svgImage.dart';
import 'package:employee/ReusableComponent/TextWidget/textWidget.dart';
import 'package:flutter/cupertino.dart';

Widget emptyEmployeeListUI({required double screenWidth,required double screenHeight}){
  return Container(
    width: screenWidth,
    color: ColorConfig().employeeListScreenBackgroundColor,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        svgImage(imagePath: AppConfig().emptyDataImage, getBoxFit: BoxFit.scaleDown, svgImageWidth: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().emptyDataIconWidth), svgImageHeight: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: SizeConfig().emptyDataIconHeight)),
        textWidget(getText: TextConfig().employeeListScreenEmptyContentText, screenHeight: screenHeight, textSize: SizeConfig().employeeListScreenEmptyContentTextSize, textColor: ColorConfig().employeeListScreenEmptyContentTextColor, getAlign: TextAlign.center, textStyle: AppConfig().robotoFontMedium, softWrap: true),
      ],
    ),
  );
}