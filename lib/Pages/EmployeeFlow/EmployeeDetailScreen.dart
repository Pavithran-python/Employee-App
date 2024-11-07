

import 'package:employee/Config/AppConfig.dart';
import 'package:employee/Config/ColorConfig.dart';
import 'package:employee/Config/SizeConfig.dart';
import 'package:employee/Config/TextConfig.dart';
import 'package:employee/Config/ValueConfig.dart';
import 'package:employee/LocalDatabase/ClientDatabase.dart';
import 'package:employee/Model/Employee.dart';
import 'package:employee/Pages/EmployeeFlow/EmployeeBloc/employee_bloc.dart';
import 'package:employee/Pages/EmployeeFlow/EmployeeListBloc/employee_list_bloc.dart';
import 'package:employee/Pages/EmployeeFlow/widgets/bottomSheetWidget.dart';
import 'package:employee/Pages/EmployeeFlow/widgets/calenderPopUpUI.dart';
import 'package:employee/Pages/EmployeeFlow/widgets/successMessageBox.dart';
import 'package:employee/ReusableComponent/AppBar/AppBarWithTitle.dart';
import 'package:employee/ReusableComponent/BottomBar/bottomBar.dart';
import 'package:employee/ReusableComponent/Image/svgImage.dart';
import 'package:employee/ReusableComponent/WidgetUI/messageBoxWidget.dart';
import 'package:employee/ReusableComponent/WidgetUI/textFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeDetailScreen extends StatefulWidget {
  const EmployeeDetailScreen({super.key,});

  @override
  State<EmployeeDetailScreen> createState(){
    return EmployeeDetailPage();
  }
}

class EmployeeDetailPage extends State<EmployeeDetailScreen> {
  //final Employee? getEmployee;
  EmployeeDetailPage();
  double screenWidth = 0;
  double screenHeight = 0;
  double statusBarHeight = 0;
  double scaleFactor = 0;
  TextEditingController employeeNameController = TextEditingController();
  TextEditingController employeeRoleController = TextEditingController();
  TextEditingController employeeJoinDateController = TextEditingController();
  TextEditingController employeeEndDateController = TextEditingController();
  List<String> getEmployeeRoleList = AppConfig().employeeRoleList;
  var dbHelper = ClientDatabase.instance;
  DateTime getStartDate = DateTime.now();
  DateTime? getEndDate;

  updateEmployee({required Employee getEmployee}) async {
    context.read<EmployeeBloc>().add(UpdateEmployee(getEmployee: getEmployee));
    Navigator.pop(context,TextConfig().updatedData);
  }

  createEmployee({required Employee getEmployee}) {
    context.read<EmployeeBloc>().add(AddEmployee(getEmployee: getEmployee));
    Navigator.pop(context,TextConfig().createdData);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*if(getEmployee!=null){
      setState(() {
        employeeNameController.text = getEmployee!.employeeName;
        employeeRoleController.text = getEmployee!.employeeRole;
        getStartDate = getEmployee!.employeeJoinedDate!;
        employeeJoinDateController.text = ValueConfig().checkTodayDate(getStartDate)?TextConfig().todayText:ValueConfig().getConvertDateFormat(getStartDate);
        getEndDate = getEmployee!.employeeEndDate;
        employeeEndDateController.text = (getEndDate!=null)?ValueConfig().checkTodayDate(getEndDate!)?TextConfig().todayText:ValueConfig().getConvertDateFormat(getEndDate!):"";
      });
    }
    else{
      setState(() {
        employeeJoinDateController.text = ValueConfig().checkTodayDate(getStartDate)?TextConfig().todayText:ValueConfig().getConvertDateFormat(getStartDate);
      });
    }*/
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    scaleFactor = MediaQuery.of(context).textScaleFactor;
    return BlocBuilder<EmployeeBloc,EmployeeState>(builder: (BuildContext context, EmployeeState state) {
      if(state is EmployeeError){
        return Container(
          width: screenWidth,
          height: screenHeight,
          child: messageBoxWidget(screenWidth: screenWidth, screenHeight: screenHeight, getMessage: state.message, getActionText: "", getCallBackFunction: (isClick){}),
        );
      }
      else if(state is EmployeeLoaded){
        Employee getEmployee = state.employee;
        employeeNameController.text = getEmployee.employeeName;
        employeeRoleController.text = getEmployee.employeeRole;
        if(getEmployee.employeeJoinedDate!=null){
          getStartDate = getEmployee.employeeJoinedDate!;
        }
        else{
          getEmployee.employeeJoinedDate = getStartDate;
        }
        employeeJoinDateController.text = ValueConfig().checkTodayDate(getStartDate)?TextConfig().todayText:ValueConfig().getConvertDateFormat(getStartDate).replaceAll(",","");
        if(getEmployee.employeeEndDate!=null){
          getEndDate = getEmployee.employeeEndDate;
        }
        else{
          getEndDate = null;
          getEmployee.employeeEndDate = null;
        }
        employeeEndDateController.text = (getEndDate!=null)?ValueConfig().checkTodayDate(getEndDate!)?TextConfig().todayText:ValueConfig().getConvertDateFormat(getEndDate!).replaceAll(",",""):"";
        return Scaffold(
          appBar: AppBarWithTitle(screenWidth: screenWidth, screenHeight: screenHeight, title: getEmployee.employeeId==null?TextConfig().appBarEmployeeDetailScreenAddTitle:TextConfig().appBarEmployeeDetailScreenUpdateTitle, updateEmployee: getEmployee.employeeId==null?false:true, getCallBackDeleteIconClick: (isClick) {
            if(isClick){
              Navigator.pop(context,TextConfig().deletedData);
            }
          },),
          body: Container(
            width: screenWidth,
            height: screenHeight,
            color: ColorConfig().employeeDetailScreenBackgroundColor,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight:SizeConfig().employeeDetailScreenTopTextFieldPadding),),
                  textFieldWidget(screenWidth: screenWidth, screenHeight: screenHeight, scaleFactor: scaleFactor, textFieldWidth: SizeConfig().textFieldEmployeeNameWidth, textFieldHeight: SizeConfig().textFieldEmployeeNameHeight, readOnly: false, textEditingController: employeeNameController, hintText: TextConfig().employeeDetailScreenEmployeeNameHint, getKeyboardType: TextInputType.name, prefixIconPath: AppConfig().employeeNameIcon, prefixIconWidth: SizeConfig().employeeNameIconWidth, prefixIconHeight: SizeConfig().employeeNameIconHeight, suffixIconPath: null, suffixIconWidth: null, suffixIconHeight: null, submitTextFunction: (getText){getEmployee.employeeName = getText;}),
                  SizedBox(height: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight:SizeConfig().employeeDetailScreenTopTextFieldPadding),),
                  textFieldWidget(screenWidth: screenWidth, screenHeight: screenHeight, scaleFactor: scaleFactor, textFieldWidth: SizeConfig().textFieldEmployeeRoleWidth, textFieldHeight: SizeConfig().textFieldEmployeeRoleHeight, readOnly: true, textEditingController: employeeRoleController, hintText: TextConfig().employeeDetailScreenSelectRoleHint, getKeyboardType: TextInputType.name, prefixIconPath: AppConfig().employeeRoleIcon, prefixIconWidth: SizeConfig().employeeRoleIconWidth, prefixIconHeight: SizeConfig().employeeRoleIconHeight, suffixIconPath: AppConfig().dropDownIcon, suffixIconWidth: SizeConfig().dropDownIconWidth, suffixIconHeight: SizeConfig().dropDownIconHeight, submitTextFunction: (getText){
                    if(getText == ""){
                      bottomSheetWidget(context: context,screenWidth: screenWidth,screenHeight: screenHeight, getEmployeeRoleList: getEmployeeRoleList, getEmployeeRoleCallBack: (getEmployeeRole) {
                        getEmployee.employeeRole = getEmployeeRole;
                        employeeRoleController.text = getEmployeeRole;
                        Navigator.pop(context);
                      },);
                    }
                  }),
                  SizedBox(height: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight:SizeConfig().employeeDetailScreenTopTextFieldPadding),),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().textFieldHorizontalPadding)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textFieldWidget(screenWidth: screenWidth, screenHeight: screenHeight, scaleFactor: scaleFactor, textFieldWidth: SizeConfig().textFieldEmployeeDateWidth, textFieldHeight: SizeConfig().textFieldEmployeeDateHeight, readOnly: true, textEditingController: employeeJoinDateController, hintText: TextConfig().employeeDetailScreenDateHintText, getKeyboardType: TextInputType.datetime, prefixIconPath: AppConfig().calenderIcon, prefixIconWidth: SizeConfig().calenderIconWidth, prefixIconHeight: SizeConfig().calenderIconHeight, suffixIconPath: null, suffixIconWidth: null, suffixIconHeight: null, submitTextFunction: (getText) async {
                          calenderPopUpUI(context: context, screenWidth: screenWidth, screenHeight: screenHeight,screenScaleFactor: scaleFactor, selectedDate: getStartDate, employeeJoinedCalender:true ,getStartDate: DateTime(1900) ,activeTab: ValueConfig().checkTodayDate(getStartDate)?1:0,callBackSelectedDate: (getDate){
                            getStartDate = getDate!;
                            if(getEndDate!=null){
                              if((getEndDate!.compareTo(getStartDate)<0)){
                                getEndDate = null;
                                employeeEndDateController.text = "";
                                getEmployee.employeeEndDate = null;
                              }
                            }
                            if(getStartDate!=null){
                              employeeJoinDateController.text = ValueConfig().checkTodayDate(getStartDate)?TextConfig().todayText:ValueConfig().getConvertDateFormat(getStartDate).toString().replaceAll(",","");
                            }
                            else{
                              employeeJoinDateController.text = "";
                            }
                            getEmployee.employeeJoinedDate = getStartDate;
                          },);
                        }),
                        svgImage(imagePath: AppConfig().toArrowIcon, getBoxFit: BoxFit.scaleDown, svgImageWidth: ValueConfig().getHorizontalValueUsingWidth(screenWidth: screenWidth, getWidth: SizeConfig().toArrowIconWidth), svgImageHeight: ValueConfig().getVerticalValueUsingHeight(screenHeight: screenHeight, getHeight: SizeConfig().toArrowIconHeight)),
                        textFieldWidget(screenWidth: screenWidth, screenHeight: screenHeight, scaleFactor: scaleFactor, textFieldWidth: SizeConfig().textFieldEmployeeDateWidth, textFieldHeight: SizeConfig().textFieldEmployeeDateHeight, readOnly: true, textEditingController: employeeEndDateController, hintText: TextConfig().employeeDetailScreenDateHintText, getKeyboardType: TextInputType.datetime, prefixIconPath: AppConfig().calenderIcon, prefixIconWidth: SizeConfig().calenderIconWidth, prefixIconHeight: SizeConfig().calenderIconHeight, suffixIconPath: null, suffixIconWidth: null, suffixIconHeight: null, submitTextFunction: (getText) async {
                          calenderPopUpUI(context: context, screenWidth: screenWidth, screenHeight: screenHeight, screenScaleFactor: scaleFactor,selectedDate: getEndDate,employeeJoinedCalender:false ,getStartDate: getStartDate ,activeTab: getEndDate==null?2:ValueConfig().checkTodayDate(getEndDate!)?1:0,callBackSelectedDate: (getDate){
                            getEndDate = getDate;
                            if(getEndDate!=null){
                              employeeEndDateController.text = ValueConfig().checkTodayDate(getEndDate!)?TextConfig().todayText:ValueConfig().getConvertDateFormat(getEndDate!).toString().replaceAll(",","");
                            }
                            else{
                              employeeEndDateController.text = "";
                            }
                            getEmployee.employeeEndDate = getEndDate;
                          });
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ),
          bottomNavigationBar: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: bottomBar(screenWidth: screenWidth, screenHeight: screenHeight, primaryButtonCallBack: (isClick) {
              FocusManager.instance.primaryFocus?.unfocus();
              if(employeeNameController.text.isNotEmpty && employeeRoleController.text.isNotEmpty &&  employeeJoinDateController.text.isNotEmpty){
                if(getEmployee.employeeId==null){
                  createEmployee(getEmployee: getEmployee);
                }
                else{
                  updateEmployee(getEmployee: getEmployee);
                }
              }
              else{
                if(employeeNameController.text.isEmpty){
                  successMessageBox(context: context, screenWidth: screenWidth, screenHeight: screenHeight, getMessage: TextConfig().employeeNameErrorMessage, getActionText: TextConfig().messageBoxDismissText, );
                }
                else if(employeeRoleController.text.isEmpty){
                  successMessageBox(context: context, screenWidth: screenWidth, screenHeight: screenHeight, getMessage: TextConfig().employeeRoleErrorMessage, getActionText: TextConfig().messageBoxDismissText,);
                }
                else{
                  successMessageBox(context: context, screenWidth: screenWidth, screenHeight: screenHeight, getMessage: TextConfig().employeeJoinDateErrorMessage, getActionText: TextConfig().messageBoxDismissText,);
                }
              }
            }, secondaryButtonCallback: (isClick) {
              FocusManager.instance.primaryFocus?.unfocus();
              Navigator.pop(context);
            }),
          ),
        );
      }
      else {
        return Container(
          width: screenWidth,
          height: screenHeight,
          child: Center(
            child: CircularProgressIndicator(
              color: ColorConfig().appBarBackgroundColor,
            ),
          )
        );
      }
    },);

  }

  Future<String?> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context,initialDate: DateTime.now(), initialEntryMode: DatePickerEntryMode.calendar,firstDate: DateTime(SizeConfig().startYear) ,initialDatePickerMode: DatePickerMode.day,lastDate: DateTime(SizeConfig().endYear));
    if (picked != null) {
      return ValueConfig().getConvertDateFormat(picked);
    }
    return null;
  }
}
