
import 'package:employee/Config/AppConfig.dart';
import 'package:employee/Config/ColorConfig.dart';
import 'package:employee/Config/SizeConfig.dart';
import 'package:employee/Config/ValueConfig.dart';
import 'package:employee/ReusableComponent/Image/svgImage.dart';
import 'package:flutter/material.dart';


Widget textFieldWidget({required double screenWidth,required double screenHeight,required double scaleFactor,required double textFieldWidth,required double textFieldHeight,required bool readOnly,required TextEditingController? textEditingController,required String hintText,required TextInputType? getKeyboardType,required String prefixIconPath,required double prefixIconWidth,required double prefixIconHeight,required String? suffixIconPath,required double? suffixIconWidth,required double? suffixIconHeight,required Function(String) submitTextFunction}){
  return Container(
    width: textFieldWidth,
    height: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: textFieldHeight+(screenWidth<screenHeight?0:(textFieldHeight*0.5))),
    child: TextFormField(
      readOnly: readOnly,
      controller: textEditingController,
      textAlignVertical: TextAlignVertical.center,
      textInputAction: TextInputAction.done,
      textAlign: TextAlign.start,
      cursorColor: ColorConfig().appBarBackgroundColor,
      keyboardType: getKeyboardType,
      onChanged: (getText){submitTextFunction(getText);},
      style:TextStyle(fontSize: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: ((SizeConfig().textFieldTextSize+(screenWidth<screenHeight?0:(SizeConfig().textFieldTextSize*0.25)))/scaleFactor)),color: ColorConfig().textFieldTextColor,fontFamily: AppConfig().robotoFontMedium),
      onTap: (){
        if(readOnly){
          submitTextFunction("");
        }
      },
      decoration: InputDecoration(
        isDense: false,
        counterText: "",
        border: OutlineInputBorder(
          borderSide: BorderSide(width: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().textFieldOuterBorderSize)>1.5?1.5:ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().textFieldOuterBorderSize),color: ColorConfig().textFieldOuterBorderColor),
          borderRadius: BorderRadius.all(Radius.circular(ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().textFieldOuterBorderRadius)>10?10:ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().textFieldOuterBorderRadius))),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().textFieldOuterBorderSize)>1.5?1.5:ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().textFieldOuterBorderSize),color: ColorConfig().textFieldOuterBorderColor),
          borderRadius: BorderRadius.all(Radius.circular(ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().textFieldOuterBorderRadius)>10?10:ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().textFieldOuterBorderRadius))),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().textFieldOuterBorderSize)>1.5?1.5:ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().textFieldOuterBorderSize),color: ColorConfig().textFieldOuterBorderColor),
          borderRadius: BorderRadius.all(Radius.circular(ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().textFieldOuterBorderRadius)>10?10:ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().textFieldOuterBorderRadius))),
        ),
        focusedBorder: readOnly?OutlineInputBorder(
          borderSide: BorderSide(width: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().textFieldOuterBorderSize)>1.5?1.5:ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().textFieldOuterBorderSize),color: ColorConfig().textFieldOuterBorderColor),
          borderRadius: BorderRadius.all(Radius.circular(ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().textFieldOuterBorderRadius)>10?10:ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().textFieldOuterBorderRadius))),
        ):OutlineInputBorder(
          borderSide: BorderSide(width: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().textFieldOuterBorderSize)>1.5?1.5:ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().textFieldOuterBorderSize),color: ColorConfig().appBarBackgroundColor),
          borderRadius: BorderRadius.all(Radius.circular(ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().textFieldOuterBorderRadius)>10?10:ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().textFieldOuterBorderRadius))),
        ),
        //contentPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.symmetric(horizontal: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().textFieldHorizontalPadding)), // add padding to adjust text
        hintText: hintText,
        hintStyle: TextStyle(fontSize: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: ((SizeConfig().textFieldHintTextSize+(screenWidth<screenHeight?0:(SizeConfig().textFieldHintTextSize*0.25)))/scaleFactor)),color: ColorConfig().textFieldTextHintColor,fontFamily: AppConfig().robotoFontMedium),
        prefixIcon: Container(
          width: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: (SizeConfig().textFieldPrefixIconHorizontalPadding+SizeConfig().textFieldPrefixIconHorizontalPadding+prefixIconWidth)),
          height: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: textFieldHeight),
          alignment: Alignment.center,
          child: svgImage(imagePath: prefixIconPath, getBoxFit: BoxFit.scaleDown, svgImageWidth: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: prefixIconWidth), svgImageHeight: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: prefixIconHeight)),
        ),
        prefixIconConstraints: BoxConstraints.expand(width:ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: (SizeConfig().textFieldPrefixIconHorizontalPadding+SizeConfig().textFieldPrefixIconHorizontalPadding+prefixIconWidth)),height:ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: textFieldHeight),),
        suffixIconConstraints: suffixIconPath!=null?BoxConstraints.expand(width:ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: (SizeConfig().textFieldSuffixIconHorizontalPadding+SizeConfig().textFieldSuffixIconHorizontalPadding+suffixIconWidth!)),height:ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: textFieldHeight),):null,
        suffixIcon:suffixIconPath!=null?Container(
          width: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: (SizeConfig().textFieldSuffixIconHorizontalPadding+SizeConfig().textFieldSuffixIconHorizontalPadding+suffixIconWidth!)),
          height: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: textFieldHeight),
          alignment: Alignment.center,
          child: svgImage(imagePath: suffixIconPath, getBoxFit: BoxFit.scaleDown, svgImageWidth: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: suffixIconWidth+(screenWidth<screenHeight?0:(suffixIconWidth*0.5))), svgImageHeight: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: suffixIconHeight!+(screenWidth<screenHeight?0:(suffixIconHeight*0.5)))),
        ):null,
      ),
    ),
  );
}