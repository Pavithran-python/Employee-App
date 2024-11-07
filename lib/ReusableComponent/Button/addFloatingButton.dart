import 'package:employee/Config/AppConfig.dart';
import 'package:employee/Config/ColorConfig.dart';
import 'package:employee/Config/SizeConfig.dart';
import 'package:employee/Config/ValueConfig.dart';
import 'package:employee/ReusableComponent/Image/svgImage.dart';
import 'package:flutter/material.dart';


Widget addFloatingButton({required double screenWidth,required Function(bool) getActionClick}){
  return SizedBox(
    width: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().addEmployeeIconBackgroundWidth),
    height: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().addEmployeeIconBackgroundWidth),
    child: FittedBox(
      child: FloatingActionButton(
        onPressed: (){
          getActionClick(true);
        },
        elevation: 2,
        splashColor: Colors.white,
        backgroundColor: ColorConfig().addEmployeeIconBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().addEmployeeIconBackgroundCornerRadius)),
        ),
        child: svgImage(imagePath: AppConfig().addEmployeeIcon, getBoxFit: BoxFit.scaleDown, svgImageWidth: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().addEmployeeIconWidth), svgImageHeight: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().addEmployeeIconWidth)),
      ),
    ),
  );
}