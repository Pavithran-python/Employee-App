import 'dart:ui';

import 'package:employee/Config/AppConfig.dart';
import 'package:employee/Config/ColorConfig.dart';
import 'package:employee/Config/TextConfig.dart';
import 'package:employee/LocalDatabase/ClientDatabase.dart';
import 'package:employee/Model/Employee.dart';
import 'package:employee/Pages/EmployeeFlow/EmployeeBloc/employee_bloc.dart';
import 'package:employee/Pages/EmployeeFlow/EmployeeDetailScreen.dart';
import 'package:employee/Pages/EmployeeFlow/EmployeeListBloc/employee_list_bloc.dart';
import 'package:employee/Pages/EmployeeFlow/widgets/employeeListUI.dart';
import 'package:employee/Pages/EmployeeFlow/widgets/emptyEmployeeListUI.dart';
import 'package:employee/Pages/EmployeeFlow/widgets/messageBox.dart';
import 'package:employee/Pages/EmployeeFlow/widgets/successMessageBox.dart';
import 'package:employee/ReusableComponent/AppBar/AppBarWithTitle.dart';
import 'package:employee/ReusableComponent/Button/addFloatingButton.dart';
import 'package:employee/ReusableComponent/WidgetUI/messageBoxWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeListScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return  EmployeeListPage();
  }

}


class EmployeeListPage extends State<EmployeeListScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  double statusBarHeight = 0;
  bool isLoading = true;
  var dbHelper = ClientDatabase.instance;
  FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;

  getAllEmployee(){
    context.read<EmployeeListBloc>().add(LoadEmployeeList(loader: false));
  }

  deleteEmployee({required Employee getDeletedEmployee}) {
    context.read<EmployeeBloc>().add(DeleteEmployee(getEmployeeId: getDeletedEmployee.employeeId!, getEmployeeStatus: AppConfig().inActiveEmployeeStatus));
    messageBox(context:context,screenWidth:screenWidth,screenHeight:screenHeight,getMessage: TextConfig().employeeListScreenEmployeeDeletedText, getActionText: TextConfig().messageBoxUndoText,undoCallBackFunction: (bool getClick) {
      undoDeleteEmployee(getEmployee: getDeletedEmployee,);
    },);
    getAllEmployee();
  }

  undoDeleteEmployee({required Employee getEmployee,}) {
    context.read<EmployeeBloc>().add(DeleteEmployee(getEmployeeId: getEmployee.employeeId!, getEmployeeStatus: AppConfig().activeEmployeeStatus));
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    getAllEmployee();
  }

  navigateToEmployeeDetailScreen(Employee? getEmployee){
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    context.read<EmployeeBloc>().add(GetEmployee(employeeId: getEmployee?.employeeId));
    Navigator.push(context, MaterialPageRoute(builder: (context) => const EmployeeDetailScreen())).then((value){
      if(value!=null){
        if(value==TextConfig().createdData){
          successMessageBox(context: context,screenWidth: screenWidth,screenHeight: screenHeight,getMessage: TextConfig().createSuccessMessage,getActionText: TextConfig().messageBoxDismissText);
          getAllEmployee();
        }
        else if(value == TextConfig().updatedData){
          successMessageBox(context: context,screenWidth: screenWidth,screenHeight: screenHeight,getMessage: TextConfig().updateSuccessMessage,getActionText: TextConfig().messageBoxDismissText);
          getAllEmployee();
        }
        else if(value == TextConfig().deletedData){
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          deleteEmployee(getDeletedEmployee: getEmployee!);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if(kIsWeb){
      Size size = MediaQuery.of(context).size;
      if(screenWidth<size.width){
        screenWidth = size.width;
      }
      if(screenHeight<size.height){
        screenHeight = size.height;
      }
    }
    else{
      screenWidth = MediaQuery.of(context).size.width;
      screenHeight = MediaQuery.of(context).size.height;
    }
    return Scaffold(
      backgroundColor:  ColorConfig().employeeDetailScreenBackgroundColor,
      appBar: AppBarWithTitle(screenWidth: screenWidth, screenHeight: screenHeight, title: TextConfig().appBarEmployeeListScreenTitle, updateEmployee: false,getCallBackDeleteIconClick: (isClick){}),
      body: BlocBuilder<EmployeeListBloc,EmployeeListState>(builder: (context,state){
        if(state is EmployeeListLoading){
          return Container(
              width: screenWidth,
              height: (kIsWeb)?screenHeight:null,
              child: Center(
                child: CircularProgressIndicator(
                  color: ColorConfig().appBarBackgroundColor,
                ),
              )
          );
        }
        else if(state is EmployeeListLoaded){
          List<Employee> getEmployeeList = state.employeeList;
          List<Employee> getCurrentEmployeeList = [];
          List<Employee> getPreviousEmployeeList = [];
          for(int i = 0 ; i < getEmployeeList.length ; i++){
            Employee getEmployee = getEmployeeList[i];
            if(getEmployee.employeeEndDate==null){
              getCurrentEmployeeList.add(getEmployee);
            }
            else{
              getPreviousEmployeeList.add(getEmployee);
            }
          }
          return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: employeeListUI(screenWidth: screenWidth, screenHeight: screenHeight, getCurrentEmployeeList: getCurrentEmployeeList, getPreviousEmployeeList: getPreviousEmployeeList, getCallBackSelectedEmployee: (getEmployee ) {
                navigateToEmployeeDetailScreen(getEmployee);
              }, getDismissedCallBack: (getEmployee ) {
                deleteEmployee(getDeletedEmployee: getEmployee);
              })
          );
        }
        else if(state is EmployeeListError){
          print("state : ${state.message}");
          return Container(
            child: messageBoxWidget(screenWidth: screenWidth, screenHeight: screenHeight, getMessage: state.message??"", getActionText: "", getCallBackFunction: (isClick){}),
          );
        }
        else{
          return emptyEmployeeListUI(screenWidth: screenWidth, screenHeight: screenHeight);
        }
      }),
      floatingActionButton: addFloatingButton(screenWidth: screenWidth, getActionClick: (isClicked) {
        if(isClicked){
          navigateToEmployeeDetailScreen(null);
        }
      },),

    );
  }
}

