

import 'package:employee/Config/AppConfig.dart';
import 'package:employee/Config/ColorConfig.dart';
import 'package:employee/Config/SizeConfig.dart';
import 'package:employee/Config/ValueConfig.dart';
import 'package:employee/ReusableComponent/Image/svgImage.dart';
import 'package:employee/ReusableComponent/TextWidget/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar AppBarWithTitle({required double screenWidth,required double screenHeight,required String title,required bool updateEmployee,required Function(bool) getCallBackDeleteIconClick}){
  return AppBar(
    toolbarHeight: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: SizeConfig().appBarHeight),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: ColorConfig().statusBarColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
    automaticallyImplyLeading: false,
    backgroundColor: ColorConfig().appBarBackgroundColor,
    titleSpacing: 0,
    title: Padding(
      padding: EdgeInsets.symmetric(horizontal: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().appBarHorizontalPadding)),
      child: Container(
        width: screenWidth,
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child:textWidget(getText: title, screenHeight: screenHeight, textSize: SizeConfig().appBarTextSize, textColor: ColorConfig().appBarTitleTextColor, getAlign: TextAlign.start, textStyle:AppConfig().robotoFontMedium, softWrap:false),
            ),
            updateEmployee?TextButton(
              onPressed: (){
                getCallBackDeleteIconClick(true);
              },
              style: TextButton.styleFrom(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: svgImage(imagePath: AppConfig().deleteEmployeeIcon, getBoxFit: BoxFit.scaleDown, svgImageWidth: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().deleteEmployeeIconWidth), svgImageHeight:ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: SizeConfig().deleteEmployeeIconHeight)),
            ):SizedBox(),
          ],
        ),
      ),
    ),
  );
}