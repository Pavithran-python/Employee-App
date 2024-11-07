

import 'package:employee/Config/AppConfig.dart';
import 'package:employee/Config/ColorConfig.dart';
import 'package:employee/Config/SizeConfig.dart';
import 'package:employee/Config/ValueConfig.dart';
import 'package:employee/ReusableComponent/Image/svgImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';


Widget calenderWidget({required double screenWidth,required double screenHeight,required double screenScaleFactor,required DateTime? selectedDate,required DateTime getStartDate,required Function(DateTime) getSelectedCallback}){
  return Container(
    width: screenWidth,
    color: ColorConfig().calenderBackgroundColor,
    padding: EdgeInsets.symmetric(horizontal: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().calenderHorizontalPadding)),
    child: TableCalendar(
      availableGestures: AvailableGestures.none,
      sixWeekMonthsEnforced: true,
      calendarFormat: CalendarFormat.month,
      headerStyle: HeaderStyle(
        formatButtonShowsNext: false,
        headerMargin: EdgeInsets.zero,
        headerPadding: EdgeInsets.only(left: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth:SizeConfig().calenderHeaderHorizontalPadding),right: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth:SizeConfig().calenderHeaderHorizontalPadding),bottom: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: SizeConfig().calenderHeaderVerticalPadding)),
        formatButtonPadding: EdgeInsets.zero,
        leftChevronMargin: EdgeInsets.zero,
        rightChevronMargin: EdgeInsets.zero,
        leftChevronPadding: EdgeInsets.zero,
        rightChevronPadding: EdgeInsets.zero,
        formatButtonVisible: false,
        titleCentered: true,
        leftChevronIcon: svgImage(imagePath: AppConfig().calenderLeftArrowIcon, getBoxFit: BoxFit.scaleDown, svgImageWidth: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().calenderArrowIconWidth), svgImageHeight: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: SizeConfig().calenderArrowIconHeight)),
        rightChevronIcon: svgImage(imagePath: AppConfig().calenderRightArrowIcon, getBoxFit: BoxFit.scaleDown, svgImageWidth: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().calenderArrowIconWidth), svgImageHeight: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: SizeConfig().calenderArrowIconHeight)),
        titleTextFormatter: (DateTime getDate,value){
          return (DateFormat("MMMM yyyy").format(getDate)).toString();
        },
        titleTextStyle: TextStyle(fontSize: screenHeight*(18/926),fontFamily: "RobotoMedium",color: Color(0xFF323238)),
      ),
      currentDay: DateTime.now(),
      calendarStyle:  CalendarStyle(
        cellPadding: EdgeInsets.zero,
        tablePadding: EdgeInsets.zero,
        markerMargin: EdgeInsets.zero,
        cellMargin: EdgeInsets.zero,
        selectedDecoration: BoxDecoration(color: selectedDate==null?null:ColorConfig().calenderSelectedDateColor, shape: BoxShape.circle),
        isTodayHighlighted: true,
        todayDecoration: BoxDecoration( shape: BoxShape.circle,border:Border.all(width: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().calenderDateBorderWidth),color:ColorConfig().calenderSelectedDateColor)),
        todayTextStyle: TextStyle(fontSize: ValueConfig().getVerticalValueUsingScaleFactorHeight(screenHeight: screenHeight, getHeight: SizeConfig().dateTextSize, scaleFactor: screenScaleFactor),fontFamily: AppConfig().robotoFontRegular,color: ColorConfig().calenderSelectedDateColor),
        outsideTextStyle: TextStyle(fontSize:  ValueConfig().getVerticalValueUsingScaleFactorHeight(screenHeight: screenHeight, getHeight: SizeConfig().dateTextSize, scaleFactor: screenScaleFactor),fontFamily: AppConfig().robotoFontRegular,color: ColorConfig().calenderDisableTextColor),
        defaultTextStyle: TextStyle(fontSize:  ValueConfig().getVerticalValueUsingScaleFactorHeight(screenHeight: screenHeight, getHeight: SizeConfig().dateTextSize, scaleFactor: screenScaleFactor),fontFamily: AppConfig().robotoFontRegular,color: ColorConfig().calenderDefaultTextColor),
        selectedTextStyle: TextStyle(fontSize:  ValueConfig().getVerticalValueUsingScaleFactorHeight(screenHeight: screenHeight, getHeight: SizeConfig().dateTextSize, scaleFactor: screenScaleFactor),fontFamily: AppConfig().robotoFontRegular,color: selectedDate==null?ColorConfig().calenderDefaultTextColor:ColorConfig().calenderUnSelectedColorTextColor),
        weekendTextStyle: TextStyle(fontSize:  ValueConfig().getVerticalValueUsingScaleFactorHeight(screenHeight: screenHeight, getHeight: SizeConfig().dateTextSize, scaleFactor: screenScaleFactor),fontFamily: AppConfig().robotoFontRegular,color: ColorConfig().calenderDefaultTextColor),
        weekNumberTextStyle: TextStyle(fontSize:  ValueConfig().getVerticalValueUsingScaleFactorHeight(screenHeight: screenHeight, getHeight: SizeConfig().dateTextSize, scaleFactor: screenScaleFactor),fontFamily: AppConfig().robotoFontRegular,color: ColorConfig().calenderDefaultTextColor),
        rangeEndTextStyle: TextStyle(fontSize:  ValueConfig().getVerticalValueUsingScaleFactorHeight(screenHeight: screenHeight, getHeight: SizeConfig().dateTextSize, scaleFactor: screenScaleFactor),fontFamily: AppConfig().robotoFontRegular,color: ColorConfig().calenderDisableTextColor),
        disabledTextStyle: TextStyle(fontSize:  ValueConfig().getVerticalValueUsingScaleFactorHeight(screenHeight: screenHeight, getHeight: SizeConfig().dateTextSize, scaleFactor: screenScaleFactor),fontFamily: AppConfig().robotoFontRegular,color: ColorConfig().calenderDisableTextColor),
      ),
      headerVisible: true,
      firstDay: getStartDate,
      lastDay: DateTime(2050),
      focusedDay: selectedDate??getStartDate,
      daysOfWeekHeight: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: SizeConfig().rowWeekHeight),
      rowHeight: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: SizeConfig().rowHeight),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(fontSize: ValueConfig().getVerticalValueUsingScaleFactorHeight(screenHeight: screenHeight, getHeight: SizeConfig().dateTextSize, scaleFactor: screenScaleFactor),fontFamily: AppConfig().robotoFontRegular,color: ColorConfig().weekTitleColor),
        weekendStyle: TextStyle(fontSize: ValueConfig().getVerticalValueUsingScaleFactorHeight(screenHeight: screenHeight, getHeight: SizeConfig().dateTextSize, scaleFactor: screenScaleFactor),fontFamily: AppConfig().robotoFontRegular,color: ColorConfig().weekTitleColor),
      ),
      onDaySelected: (selectedDay, focusedDay) {
        selectedDate = selectedDay;
        getSelectedCallback(selectedDate!);
      },
      selectedDayPredicate: (day) {
        return isSameDay(selectedDate, day);
      },
      onPageChanged: (DateTime getDate){

      },
      onCalendarCreated: (PageController getScroller){

      },
    ),
  );
}