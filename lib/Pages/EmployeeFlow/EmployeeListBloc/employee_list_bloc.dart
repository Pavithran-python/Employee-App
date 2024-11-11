import 'package:bloc/bloc.dart';
import 'package:employee/Config/AppConfig.dart';
import 'package:employee/LocalDatabase/ClientDatabase.dart';
import 'package:employee/Model/Employee.dart';
import 'package:meta/meta.dart';

part 'employee_list_event.dart';
part 'employee_list_state.dart';

class EmployeeListBloc extends Bloc<EmployeeListEvent, EmployeeListState> {
  var dbHelper = ClientDatabase.instance;
  EmployeeListBloc() : super(EmployeeListInitial()) {
    on<LoadEmployeeList>((event,emit) async{
      if(event.loader){
        emit(EmployeeListLoading());
      }
      try{
        final List<Employee> employeeList = await dbHelper.getAllEmployee();
        emit(EmployeeListLoaded(employeeList: employeeList));
      }
      catch(e){
        print("Error : ${e}");
        emit(EmployeeListError(message: e.toString()));
      }
    });

  }
}
