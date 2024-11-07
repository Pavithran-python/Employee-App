

import 'package:employee/Config/ColorConfig.dart';
import 'package:employee/Config/SizeConfig.dart';
import 'package:employee/Config/TextConfig.dart';
import 'package:employee/Config/ValueConfig.dart';
import 'package:employee/ReusableComponent/Button/calenderTabButton.dart';
import 'package:flutter/cupertino.dart';

Widget calenderTopWidget({required double screenWidth,required double screenHeight,required DateTime? selectedDate,required DateTime startDate,required int activeTab,required bool employeeJoinedCalender,required Function(DateTime?) callBackSelectedDate,required Function(int) callBackActiveTab}){
  return Container(
    width: screenWidth,
    decoration: BoxDecoration(
      color: ColorConfig().calenderTopWidgetBackgroundColor,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().calenderPopUpBorderRadius)),topRight: Radius.circular(ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().calenderPopUpBorderRadius))),
    ),
    child: Column(
      children: [
        SizedBox(
          height: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: SizeConfig().calenderTopWidgetTopPadding),
        ),
        employeeJoinedCalender?Container(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  calenderTabButton(screenWidth: screenWidth, screenHeight: screenHeight, buttonWidth: SizeConfig().calenderTapButtonWidth, buttonHeight: SizeConfig().calenderTapButtonHeight, buttonRadius: SizeConfig().calenderTapButtonRadius, buttonText: TextConfig().tabButtonTodayText,activeTab:activeTab==1?true:false,buttonPressedFunction: (isClick){
                    activeTab = 1;
                    callBackActiveTab(activeTab);
                    selectedDate = DateTime.now();
                    callBackSelectedDate(selectedDate!);
                  }),
                  calenderTabButton(screenWidth: screenWidth, screenHeight: screenHeight, buttonWidth: SizeConfig().calenderTapButtonWidth, buttonHeight: SizeConfig().calenderTapButtonHeight, buttonRadius: SizeConfig().calenderTapButtonRadius, buttonText: TextConfig().tabButtonNextMondayText,activeTab:activeTab==2?true:false, buttonPressedFunction: (isClick){
                    activeTab = 2;
                    callBackActiveTab(activeTab);
                    selectedDate = selectedDate!.add(Duration(days: ValueConfig().checkNextMondayCondition(getDateTime: selectedDate!)));
                    callBackSelectedDate(selectedDate!);
                  }),
                ],
              ),
            ),
            SizedBox(
              height: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: SizeConfig().calenderTabButtonBetweenPadding),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  calenderTabButton(screenWidth: screenWidth, screenHeight: screenHeight,  buttonWidth: SizeConfig().calenderTapButtonWidth, buttonHeight: SizeConfig().calenderTapButtonHeight, buttonRadius: SizeConfig().calenderTapButtonRadius, buttonText: TextConfig().tabButtonNextTuesdayText,activeTab:activeTab==3?true:false, buttonPressedFunction: (isClick){
                    activeTab = 3;
                    callBackActiveTab(activeTab);
                    selectedDate = selectedDate!.add(Duration(days: ValueConfig().checkNextTuesdayCondition(getDateTime: selectedDate!)));
                    callBackSelectedDate(selectedDate!);
                  }),
                  calenderTabButton(screenWidth: screenWidth, screenHeight: screenHeight,  buttonWidth: SizeConfig().calenderTapButtonWidth, buttonHeight: SizeConfig().calenderTapButtonHeight, buttonRadius: SizeConfig().calenderTapButtonRadius, buttonText: TextConfig().tabButtonWeekText,activeTab:activeTab==4?true:false, buttonPressedFunction: (isClick){
                    activeTab = 4;
                    callBackActiveTab(activeTab);
                    selectedDate = selectedDate!.add(Duration(days: 7));
                    callBackSelectedDate(selectedDate!);
                  }),
                ],
              ),
            ),
          ],
        ),):Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              calenderTabButton(screenWidth: screenWidth, screenHeight: screenHeight, buttonWidth: SizeConfig().calenderTapButtonWidth, buttonHeight: SizeConfig().calenderTapButtonHeight, buttonRadius: SizeConfig().calenderTapButtonRadius, buttonText: TextConfig().tabButtonNoDateText, activeTab:activeTab==2?true:false,buttonPressedFunction: (isClick){
                activeTab = 2;
                callBackActiveTab(activeTab);
                selectedDate = null;
                callBackSelectedDate(selectedDate);
              }),
              calenderTabButton(screenWidth: screenWidth, screenHeight: screenHeight, buttonWidth: SizeConfig().calenderTapButtonWidth, buttonHeight: SizeConfig().calenderTapButtonHeight, buttonRadius: SizeConfig().calenderTapButtonRadius, buttonText: TextConfig().tabButtonTodayText,activeTab:activeTab==1?true:false ,buttonPressedFunction: (isClick){
                activeTab = 1;
                if(DateTime.now().compareTo(startDate)>0){
                  callBackActiveTab(activeTab);
                  selectedDate = DateTime.now();
                  callBackSelectedDate(selectedDate!);
                }
              }),
            ],
          ),
        ),
        SizedBox(
          height: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: SizeConfig().calenderTopWidgetTopPadding),
        ),
      ],
    ),
  );
}