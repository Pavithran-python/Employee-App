part of 'employee_bloc.dart';

@immutable
abstract class EmployeeEvent {}

//Create a new Employee
class AddEmployee extends EmployeeEvent{
  final Employee getEmployee;
  AddEmployee({required this.getEmployee});
}

//Get Employee
class GetEmployee extends EmployeeEvent{
  final int? employeeId;
  GetEmployee({required this.employeeId});
}

//Update old Employee records
class UpdateEmployee extends EmployeeEvent{
  final Employee getEmployee;
  UpdateEmployee({required this.getEmployee});
}

//Delete Employee
class DeleteEmployee extends EmployeeEvent{
  final int getEmployeeId;
  final int getEmployeeStatus;
  DeleteEmployee({required this.getEmployeeId,required this.getEmployeeStatus});
}