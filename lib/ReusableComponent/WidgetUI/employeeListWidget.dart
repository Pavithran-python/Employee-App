
import 'package:employee/Config/AppConfig.dart';
import 'package:employee/Config/ColorConfig.dart';
import 'package:employee/Config/SizeConfig.dart';
import 'package:employee/Config/TextConfig.dart';
import 'package:employee/Config/ValueConfig.dart';
import 'package:employee/Model/Employee.dart';
import 'package:employee/ReusableComponent/TextWidget/textWidget.dart';
import 'package:flutter/material.dart';

Widget employeeListWidget({required double screenWidth,required double screenHeight,required Employee getEmployeeDetail,required Function(Employee) callBackSelectedEmployee}){
  return Column(
    children: [
      Container(
        width: screenWidth,
        color: ColorConfig().employeeListviewBackgroundColor,
        alignment: Alignment.centerLeft,
        child: TextButton(
          onPressed: (){
            callBackSelectedEmployee(getEmployeeDetail);
          },
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child:Container(
            width: screenWidth,
            padding: EdgeInsets.all(ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().employeeListviewPadding))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget(getText: getEmployeeDetail.employeeName, screenHeight: screenHeight, textSize: SizeConfig().employeeListviewEmployeeNameTextSize, textColor: ColorConfig().employeeListviewNameTextColor, getAlign: TextAlign.start, textStyle: AppConfig().robotoFontMedium, softWrap: true),
                SizedBox(height: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: SizeConfig().employeeListviewBetweenPaddingHeight),),
                textWidget(getText: getEmployeeDetail.employeeRole, screenHeight: screenHeight, textSize: SizeConfig().employeeListviewEmployeeRoleTextSize, textColor: ColorConfig().employeeListviewRoleTextColor, getAlign: TextAlign.start, textStyle: AppConfig().robotoFontRegular, softWrap: true),
                SizedBox(height: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: SizeConfig().employeeListviewBetweenPaddingHeight),),
                textWidget(getText: (getEmployeeDetail.employeeEndDate!=null)?("${ValueConfig().checkTodayDate(getEmployeeDetail.employeeJoinedDate!)?TextConfig().todayText:ValueConfig().getConvertDateFormat(getEmployeeDetail.employeeJoinedDate!)} - ${ValueConfig().checkTodayDate(getEmployeeDetail.employeeEndDate!)?TextConfig().todayText:ValueConfig().getConvertDateFormat(getEmployeeDetail.employeeEndDate!)}"):("${TextConfig().employeeListviewFromText}${ValueConfig().checkTodayDate(getEmployeeDetail.employeeJoinedDate)?TextConfig().todayText:ValueConfig().getConvertDateFormat(getEmployeeDetail.employeeJoinedDate)}"), screenHeight: screenHeight, textSize: SizeConfig().employeeListviewEmployeeDateTextSize, textColor: ColorConfig().employeeListviewDateTextColor, getAlign: TextAlign.start, textStyle: AppConfig().robotoFontRegular, softWrap: true),
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: SizeConfig().employeeListviewSeparatePadding),
      ),
    ],
  );
}