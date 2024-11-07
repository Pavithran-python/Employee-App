

import 'package:intl/intl.dart';
import 'SizeConfig.dart';

class ValueConfig{

  double getHorizontalValueUsingHeight({required double screenWidth,required double getHeight}){
    return screenWidth*(getHeight/SizeConfig().screenWidth);
  }

  double getHorizontalValueUsingWidth({required double screenWidth,required double getWidth}){
    return screenWidth*(getWidth/SizeConfig().screenWidth);
  }

  double getVerticalValueUsingHeight({required double screenHeight,required double getHeight}){
    return screenHeight*(getHeight/SizeConfig().screenHeight);
  }

  double getVerticalValueUsingScaleFactorHeight({required double screenHeight,required double getHeight,required double scaleFactor}){
    return screenHeight*(getHeight/(SizeConfig().screenHeight*scaleFactor));
  }

  double getVerticalValueUsingWidth({required double screenHeight,required double getWidth}){
    return screenHeight*(getWidth/SizeConfig().screenHeight);
  }

  String getConvertDateFormat(DateTime? getDate){
    try{
      if(getDate==null){
        return getDate.toString();
      }
      else{
        var dateConvertFormat = DateFormat("d MMM, yyyy");
        String convertedFormat = dateConvertFormat.format(getDate);
        return convertedFormat;
      }
    }
    catch(e){
      return getDate.toString();
    }
  }

  DateTime? getConvertChangeDateFormat(String getDate){
    try{
      var dateConvertChangeFormat = DateFormat("d MMM, yyyy");
      DateTime convertedFormat = dateConvertChangeFormat.parse(getDate);
      return convertedFormat;
    }
    catch(e){
      return null;
    }
  }

  bool checkTodayDate(DateTime? getSelectedDate){
    if(getSelectedDate==null){
      return false;
    }
    else{
      if(getSelectedDate.month == DateTime.now().month && getSelectedDate.year == DateTime.now().year && getSelectedDate.day == DateTime.now().day){
        return true;
      }
      return  false;
    }
  }

  bool checkNextWeeCondition({required DateTime getDateTime,required int weekDay}){
    if(DateTime.now().subtract(Duration(days: weekDay)).compareTo(getDateTime)>0){
      return true;
    }
    return false;
  }

  int checkNextMondayCondition({required DateTime getDateTime}){
    int getDayOfWeek = getDateTime.weekday;
    int targetWeekDay = 8-getDayOfWeek;
    return targetWeekDay;
  }

  int checkNextTuesdayCondition({required DateTime getDateTime}){
    int getDayOfWeek = getDateTime.weekday;
    int targetWeekDay;
    if(getDayOfWeek==1){
      targetWeekDay = 1;
    }
    else{
      targetWeekDay = 9-getDayOfWeek;
    }
    return targetWeekDay;
  }

}