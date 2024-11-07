import 'package:employee/Config/AppConfig.dart';
import 'package:employee/Config/ColorConfig.dart';
import 'package:employee/Config/SizeConfig.dart';
import 'package:employee/Config/TextConfig.dart';
import 'package:employee/Config/ValueConfig.dart';
import 'package:employee/Model/Employee.dart';
import 'package:employee/Pages/EmployeeFlow/widgets/emptyEmployeeListUI.dart';
import 'package:employee/ReusableComponent/Image/svgImage.dart';
import 'package:employee/ReusableComponent/TextWidget/textWidget.dart';
import 'package:employee/ReusableComponent/WidgetUI/employeeListWidget.dart';
import 'package:employee/ReusableComponent/WidgetUI/employeeSectionTitle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget employeeListUI({required double screenWidth, required double screenHeight,required List<Employee> getCurrentEmployeeList,required List<Employee> getPreviousEmployeeList,required Function(Employee) getCallBackSelectedEmployee,required Function(Employee) getDismissedCallBack}){
  return Container(
    width: screenWidth,
    height: screenHeight,
    color: ColorConfig().employeeListScreenBackgroundColor,
    child: (getPreviousEmployeeList.isEmpty && getCurrentEmployeeList.isEmpty)?emptyEmployeeListUI(screenWidth: screenWidth, screenHeight: screenHeight):SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getCurrentEmployeeList.isNotEmpty?employeeSectionTitle(screenWidth: screenWidth, screenHeight: screenHeight, getTitle: TextConfig().employeeSectionTitleCurrentEmployeeText):const SizedBox(),
          ListView.builder(
            shrinkWrap: true,
            itemCount: getCurrentEmployeeList.length,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: ((BuildContext context, int index) {
            return Dismissible(
              direction: DismissDirection.endToStart,
              key: Key(getCurrentEmployeeList[index].employeeId.toString()),
              onDismissed: (direction) {
                getDismissedCallBack(getCurrentEmployeeList[index]);
                },
              background: deleteWidget(screenWidth: screenWidth,screenHeight: screenHeight),
              child:employeeListWidget(screenWidth: screenWidth, screenHeight: screenHeight, getEmployeeDetail: getCurrentEmployeeList[index], callBackSelectedEmployee: (getEmployee) { getCallBackSelectedEmployee(getEmployee);}),
            );
            }),
          ),
          getPreviousEmployeeList.isNotEmpty?employeeSectionTitle(screenWidth: screenWidth, screenHeight: screenHeight, getTitle: TextConfig().employeeSectionTitlePreviousEmployeeText):const SizedBox(),
          ListView.builder(
            shrinkWrap: true,
            itemCount: getPreviousEmployeeList.length,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: ((BuildContext context, int index) {
              return Dismissible(
                direction: DismissDirection.endToStart,
                key: Key(getPreviousEmployeeList[index].employeeId.toString()),
                onDismissed: (direction) {
                  getDismissedCallBack(getPreviousEmployeeList[index]);
                },
                background: deleteWidget(screenWidth: screenWidth,screenHeight: screenHeight),
                child:employeeListWidget(screenWidth: screenWidth, screenHeight: screenHeight, getEmployeeDetail: getPreviousEmployeeList[index],callBackSelectedEmployee: (getEmployee) { getCallBackSelectedEmployee(getEmployee);}),
              );
            }),
          ),
          Container(
            width: screenWidth,
            padding: EdgeInsets.symmetric(horizontal: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().employeeListScreenSwipeRightTextHorizontalPadding),vertical: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: SizeConfig().employeeListScreenSwipeRightTextVerticalPadding)),
            child: textWidget(getText: TextConfig().employeeListScreenSwipeToDeleteText, screenHeight: screenHeight, textSize: SizeConfig().employeeListScreenSwipeRightTextSize, textColor: ColorConfig().employeeListScreenSwipeRightTextColor, getAlign: TextAlign.start, textStyle: AppConfig().robotoFontRegular, softWrap: true),
          ),
        ],
      ),
    ),
  );
}

Widget deleteWidget({required double screenWidth,required double screenHeight}) {
  return Container(
    alignment: Alignment.centerRight,
    padding: EdgeInsets.only(right: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().deleteEmployeeIconRightPadding)),
    color: ColorConfig().deleteEmployeeIconBackgroundColor,
    child: svgImage(imagePath: AppConfig().deleteEmployeeIcon, getBoxFit: BoxFit.scaleDown, svgImageWidth: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().deleteEmployeeIconWidth), svgImageHeight: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: SizeConfig().deleteEmployeeIconHeight)),
  );
}