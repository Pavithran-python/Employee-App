import 'package:bloc/bloc.dart';
import 'package:employee/Config/AppConfig.dart';
import 'package:employee/LocalDatabase/ClientDatabase.dart';
import 'package:employee/Model/Employee.dart';
import 'package:meta/meta.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  var dbHelper = ClientDatabase.instance;
  EmployeeBloc() : super(EmployeeInitial()) {
    on<AddEmployee>((event, emit) async{
      try{
        await dbHelper.createEmployee(getEmployee: event.getEmployee);
      }
      catch(e){
        emit(EmployeeError(message: e.toString()));
      }
    });
    on<GetEmployee>((event, emit) async{
      try{
        Employee employee = Employee(employeeId: null, employeeName: "", employeeRole: "", employeeJoinedDate: null, employeeEndDate: null, employeeStatus: AppConfig().activeEmployeeStatus);
        if(event.employeeId!=null){
          employee = await dbHelper.getEmployee(getId: event.employeeId!);
        }
        emit(EmployeeLoaded(employee: employee));
      }
      catch(e){
        emit(EmployeeError(message: e.toString()));
      }
    });
    on<UpdateEmployee>((event,emit) async{
      try{
        await dbHelper.updateEmployee(getEmployee: event.getEmployee);
      }
      catch(e){
        emit(EmployeeError(message: e.toString()));
      }
    });
    on<DeleteEmployee>((event,emit)async{
      try{
        await dbHelper.getDeleteEmployee(employeeId: event.getEmployeeId, status: event.getEmployeeStatus);
      }
      catch(e){
        emit(EmployeeError(message: e.toString()));
      }
    });
  }
}
