

import 'package:employee/Config/AppConfig.dart';
import 'package:employee/Config/ColorConfig.dart';
import 'package:employee/Config/SizeConfig.dart';
import 'package:employee/Config/ValueConfig.dart';
import 'package:employee/ReusableComponent/TextWidget/textWidget.dart';
import 'package:flutter/material.dart';

Widget employeeRoleListWidget({required double screenWidth,required double screenHeight,required String employeeRole,required int getIndex,required Function(String) callBackRoleSelected}){
  return Container(
    width: screenWidth,
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorConfig().employeeRoleListBackgroundColor,
            borderRadius: getIndex==0?BorderRadius.only(topLeft: Radius.circular(ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().bottomSheetCornerRadius)>25?25:ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().bottomSheetCornerRadius)),topRight: Radius.circular(ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().bottomSheetCornerRadius)>25?25:ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().bottomSheetCornerRadius))):BorderRadius.zero,
          ),
          child: TextButton(
            onPressed: (){
              callBackRoleSelected(employeeRole);
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: getIndex==0?BorderRadius.only(topLeft: Radius.circular(ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().bottomSheetCornerRadius)),topRight: Radius.circular(ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().bottomSheetCornerRadius))):BorderRadius.zero),
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Container(
              width: screenWidth,
              height: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight:SizeConfig().employeeRoleListviewHeight+(screenWidth<screenHeight?0:(SizeConfig().employeeRoleListviewHeight*0.5))),
              alignment: Alignment.center,
              child: textWidget(getText: employeeRole, screenHeight: screenHeight, textSize: SizeConfig().employeeRoleListviewTextSize+(screenWidth<screenHeight?0:(SizeConfig().employeeRoleListviewTextSize*0.25)), textColor: ColorConfig().employeeRoleListTextColor, getAlign: TextAlign.center, textStyle: AppConfig().robotoFontRegular, softWrap: true),
            ),
          ),
        ),
        SizedBox(
          width: screenWidth,
          height: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight:SizeConfig().employeeRoleListviewGapPadding+(screenWidth<screenHeight?0:(SizeConfig().employeeRoleListviewGapPadding*3))),
        ),
      ],
    ),
  );
}