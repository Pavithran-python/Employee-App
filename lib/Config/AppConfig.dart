

class AppConfig{

  //Fonts
  String robotoFontMedium = "RobotoMedium";
  String robotoFontRegular = "RobotoRegular";

  //Images
  String addEmployeeIcon = "assets/svg/add_icon.svg";
  String calenderIcon = "assets/svg/calender_icon.svg";
  String deleteEmployeeIcon = "assets/svg/delete_employee_icon.svg";
  String dropDownIcon = "assets/svg/dropdown_icon.svg";
  String employeeNameIcon = "assets/svg/employee_name_icon.svg";
  String employeeRoleIcon = "assets/svg/employee_role_icon.svg";
  String emptyDataImage = "assets/svg/empty_data_image.svg";
  String toArrowIcon = "assets/svg/to_arrow_icon.svg";
  String calenderRightArrowIcon = "assets/svg/calender_right_arrow.svg";
  String calenderLeftArrowIcon = "assets/svg/calender_left_arrow.svg";

  List<String> employeeRoleList = [
    "Product Designer",
    "Flutter Developer",
    "QA Tester",
    "Product Owner",
  ];

  List<String> getEmployeeRoleList(){
    return employeeRoleList;
  }

  int inActiveEmployeeStatus = 0;
  int activeEmployeeStatus = 1;

}