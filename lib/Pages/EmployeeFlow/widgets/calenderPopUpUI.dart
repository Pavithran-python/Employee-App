

import 'package:employee/Config/ColorConfig.dart';
import 'package:employee/Config/SizeConfig.dart';
import 'package:employee/Config/ValueConfig.dart';
import 'package:employee/Pages/EmployeeFlow/widgets/calenderBottomWidget.dart';
import 'package:employee/Pages/EmployeeFlow/widgets/calenderTopWidget.dart';
import 'package:employee/Pages/EmployeeFlow/widgets/calenderWidget.dart';
import 'package:flutter/material.dart';

calenderPopUpUI({required BuildContext context,required double screenWidth,required double screenHeight,required double screenScaleFactor,required DateTime? selectedDate,required bool employeeJoinedCalender,required DateTime getStartDate,required int activeTab,required Function(DateTime?) callBackSelectedDate}){
  showDialog(
      context: context,
      barrierColor: ColorConfig().calenderPopUpTransparentBackgroundColor.withOpacity(SizeConfig().calenderPopUpTransparentBackgroundColorOpacity),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, StateSetter stateSetter){
          return Dialog(
            insetPadding: EdgeInsets.zero,
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Container(
                  width: screenWidth- ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().calenderPopUpWidthPadding),
                  decoration: BoxDecoration(
                    color:ColorConfig().calenderPopUpBackgroundColor,
                    borderRadius: BorderRadius.circular(ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().calenderPopUpBorderRadius)>25?25:ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().calenderPopUpBorderRadius)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      calenderTopWidget(screenWidth: screenWidth, screenHeight: screenHeight, selectedDate: selectedDate,startDate: getStartDate, activeTab: activeTab, employeeJoinedCalender: employeeJoinedCalender, callBackSelectedDate: (DateTime? getDateTime) {
                        stateSetter((){
                          selectedDate  = getDateTime;
                        });
                      },callBackActiveTab: (int getActiveTab){
                        stateSetter((){
                          activeTab = getActiveTab;
                        });
                      }),
                      calenderWidget(screenWidth: screenWidth, screenHeight: screenHeight, screenScaleFactor: screenScaleFactor, selectedDate: selectedDate, getStartDate: getStartDate, getSelectedCallback: (DateTime? getDateTime) {
                        stateSetter((){
                          selectedDate  = getDateTime;
                        });
                      }),
                      SizedBox(
                        height: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: SizeConfig().calenderPopUpHeightPadding),
                      ),
                      calenderBottomWidget(context: context, screenWidth: screenWidth, screenHeight: screenHeight, selectedDate: selectedDate, callBackSelectedDate: callBackSelectedDate),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      }
  );
}