
import 'package:employee/Config/ValueConfig.dart';

class Employee{
  int? employeeId;
  String employeeName;
  String employeeRole;
  DateTime? employeeJoinedDate;
  DateTime? employeeEndDate;
  int employeeStatus;

  Employee({required this.employeeId,required this.employeeName,required this.employeeRole,required this.employeeJoinedDate,required this.employeeEndDate,required this.employeeStatus});

  Map<String,dynamic> toMap(){
    return {
      "employeeName":employeeName,
      "employeeRole":employeeRole,
      "employeeJoinDate":ValueConfig().getConvertDateFormat(employeeJoinedDate),
      "employeeEndDate": employeeEndDate==null?"":ValueConfig().getConvertDateFormat(employeeEndDate),
      "employeeStatus":employeeStatus
    };
  }

  factory Employee.fromMap(Map<String,dynamic> map){
    return Employee(employeeId: map["employeeId"],employeeName: map["employeeName"],employeeRole: map["employeeRole"],employeeJoinedDate: map["employeeJoinDate"]==null?null:ValueConfig().getConvertChangeDateFormat(map["employeeJoinDate"]),employeeEndDate: map["employeeEndDate"]==null?null:ValueConfig().getConvertChangeDateFormat(map["employeeEndDate"]),employeeStatus: map["employeeStatus"]);
  }
}