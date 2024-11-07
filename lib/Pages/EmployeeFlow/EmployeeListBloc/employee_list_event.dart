part of 'employee_list_bloc.dart';

@immutable
abstract class EmployeeListEvent {}

class LoadEmployeeList extends EmployeeListEvent{
  final bool loader;
  LoadEmployeeList({required this.loader});
}
