import 'package:employee/Config/ValueConfig.dart';
import 'package:flutter/cupertino.dart';

Text textWidget({required String getText,required double screenHeight,required double textSize,required Color textColor,required TextAlign getAlign,required String textStyle,required bool softWrap}){
  return Text(getText,textScaler: const TextScaler.linear(1.0),textAlign: getAlign,softWrap: softWrap,overflow: softWrap?null:TextOverflow.ellipsis,style:  TextStyle(fontSize: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: textSize,),color: textColor,fontFamily:textStyle),);
}