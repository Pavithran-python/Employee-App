part of 'employee_bloc.dart';

@immutable
sealed class EmployeeState {}


class EmployeeInitial extends EmployeeState{

}

class EmployeeLoading extends EmployeeState{

}

//Employee Data
class EmployeeLoaded extends EmployeeState{
  final Employee employee;
  EmployeeLoaded({required this.employee});
}


//Error Data
class EmployeeError extends EmployeeState{
  final String message;
  EmployeeError({required this.message});
}
