part of 'employee_list_bloc.dart';

@immutable
abstract class EmployeeListState {}

class EmployeeListInitial extends EmployeeListState{

}

class EmployeeListLoading extends EmployeeListState{

}

//Load return employee
class EmployeeListLoaded extends EmployeeListState{
  final List<Employee> employeeList;
  EmployeeListLoaded({required this.employeeList});
}


//Error Data
class EmployeeListError extends EmployeeListState{
  final String message;
  EmployeeListError({required this.message});
}