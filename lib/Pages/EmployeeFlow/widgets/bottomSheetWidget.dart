

import 'package:employee/Config/ColorConfig.dart';
import 'package:employee/Config/SizeConfig.dart';
import 'package:employee/Config/ValueConfig.dart';
import 'package:employee/ReusableComponent/WidgetUI/employeeRoleListWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future bottomSheetWidget({required BuildContext context,required double screenWidth,required double screenHeight,required List<String> getEmployeeRoleList,required Function(String) getEmployeeRoleCallBack}){
  return showModalBottomSheet(
    context: context,
    barrierColor: ColorConfig().bottomSheetTransparentColor.withOpacity(SizeConfig().bottomSheetTransparentColorOpacity),
    backgroundColor: ColorConfig().bottomSheetBackgroundColor,
    enableDrag: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().bottomSheetCornerRadius)),topRight: Radius.circular(ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().bottomSheetCornerRadius))),
    ),
    builder: (BuildContext context) {
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: getEmployeeRoleList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context,int index){
          return employeeRoleListWidget(screenWidth: screenWidth, screenHeight: screenHeight, employeeRole: getEmployeeRoleList[index], getIndex: index, callBackRoleSelected: (getEmployeeRole){
            getEmployeeRoleCallBack(getEmployeeRole);
          });
        },
      );
    },
  );
}