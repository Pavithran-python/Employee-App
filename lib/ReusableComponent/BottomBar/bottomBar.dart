
import 'package:employee/Config/ColorConfig.dart';
import 'package:employee/Config/SizeConfig.dart';
import 'package:employee/Config/TextConfig.dart';
import 'package:employee/Config/ValueConfig.dart';
import 'package:employee/ReusableComponent/Button/primaryButton.dart';
import 'package:employee/ReusableComponent/Button/secondaryButton.dart';
import 'package:flutter/cupertino.dart';

Widget bottomBar({required double screenWidth,required double screenHeight,required Function(bool) primaryButtonCallBack,required Function(bool) secondaryButtonCallback}){
  return Container(
    width: screenWidth,
    height: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: SizeConfig().bottomBarHeight+(screenWidth<screenHeight?0:(SizeConfig().bottomBarHeight*0.25))),
    decoration: BoxDecoration(
      color: ColorConfig().bottomBarBackgroundColor,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: ColorConfig().bottomBarBoxShadowColor,
          blurRadius: SizeConfig().bottomBarBlurRadiusHeight,
          blurStyle: BlurStyle.outer,
        ),
      ],
    ),
    alignment: Alignment.centerRight,
    padding: EdgeInsets.symmetric(horizontal: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().bottomBarHorizontalPadding)>20?20: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().bottomBarHorizontalPadding)),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          secondaryButton(screenWidth: screenWidth, screenHeight: screenHeight, buttonWidth: SizeConfig().secondaryButtonWidth, buttonHeight: SizeConfig().secondaryButtonHeight, buttonRadius: SizeConfig().secondaryButtonCornerRadius, buttonText: TextConfig().secondaryButtonText, buttonPressedFunction:(isClick){
            if(isClick){
              secondaryButtonCallback(true);
            }
          }),
          SizedBox(
            width: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().paddingBetweenPrimarySecondaryButton),
          ),
          primaryButton(screenWidth: screenWidth, screenHeight: screenHeight, buttonWidth: SizeConfig().primaryButtonWidth, buttonHeight: SizeConfig().primaryButtonHeight, buttonRadius: SizeConfig().primaryButtonCornerRadius, buttonText: TextConfig().primaryButtonAddEmployeeText, buttonPressedFunction: (isClick){
            if(isClick){
              primaryButtonCallBack(true);
            }
          })
        ],
      ),
    ),

  );
}