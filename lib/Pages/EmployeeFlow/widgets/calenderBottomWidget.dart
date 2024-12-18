

import 'package:employee/Config/AppConfig.dart';
import 'package:employee/Config/ColorConfig.dart';
import 'package:employee/Config/SizeConfig.dart';
import 'package:employee/Config/TextConfig.dart';
import 'package:employee/Config/ValueConfig.dart';
import 'package:employee/ReusableComponent/Button/primaryButton.dart';
import 'package:employee/ReusableComponent/Button/secondaryButton.dart';
import 'package:employee/ReusableComponent/Image/svgImage.dart';
import 'package:employee/ReusableComponent/TextWidget/textWidget.dart';
import 'package:flutter/cupertino.dart';


Widget calenderBottomWidget({required BuildContext context,required double screenWidth,required double screenHeight,required DateTime? selectedDate,required Function(DateTime?) callBackSelectedDate}){
  return Container(
    width: screenWidth,
    decoration: BoxDecoration(
      color: ColorConfig().calenderBottomWidgetBackground,
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().calenderPopUpBorderRadius)),bottomRight: Radius.circular(ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().calenderPopUpBorderRadius))),
    ),
    padding: EdgeInsets.all(ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().calenderPopUpBorderRadius)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                svgImage(imagePath: AppConfig().calenderIcon, getBoxFit: BoxFit.scaleDown, svgImageWidth:ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth:  (SizeConfig().calenderIconWidth+(screenWidth<screenHeight?0:(SizeConfig().calenderIconWidth*0.5)))), svgImageHeight: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: SizeConfig().calenderIconHeight+(screenWidth<screenHeight?0:(SizeConfig().calenderIconHeight*0.5)))),
                SizedBox(
                  width: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().paddingBetweenCalenderText),
                ),
                textWidget(getText: selectedDate==null?TextConfig().tabButtonNoDateText:ValueConfig().checkTodayDate(selectedDate)?TextConfig().todayText:ValueConfig().getConvertDateFormat(selectedDate).toString().replaceAll(",", ""), screenHeight: screenHeight, textSize: SizeConfig().calenderNoDateTextSize+(screenWidth<screenHeight?0:(SizeConfig().calenderNoDateTextSize*0.5)), textColor: ColorConfig().calenderNoDateTextColor, getAlign: TextAlign.start, textStyle: AppConfig().robotoFontRegular, softWrap: true),
              ],
            ),
          ),
        ),
        Flexible(child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              secondaryButton(screenWidth: screenWidth, screenHeight: screenHeight, buttonWidth: SizeConfig().secondaryButtonWidth, buttonHeight: SizeConfig().secondaryButtonHeight, buttonRadius: SizeConfig().secondaryButtonCornerRadius, buttonText: TextConfig().secondaryButtonText, buttonPressedFunction: (isClick){
                Navigator.pop(context);
              }),
              SizedBox(
                width: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().paddingBetweenTwoButton),
              ),
              primaryButton(screenWidth: screenWidth, screenHeight: screenHeight, buttonWidth: SizeConfig().primaryButtonWidth, buttonHeight: SizeConfig().primaryButtonHeight, buttonRadius: SizeConfig().primaryButtonCornerRadius, buttonText: TextConfig().primaryButtonAddEmployeeText, buttonPressedFunction: (isClick){
                callBackSelectedDate(selectedDate);
                Navigator.pop(context);
              }),
            ],
          ),),
          ),
      ],
    ),
  );
}