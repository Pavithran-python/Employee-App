
import 'package:employee/Config/AppConfig.dart';
import 'package:employee/Config/TextConfig.dart';
import 'package:employee/Config/ValueConfig.dart';
import 'package:employee/Model/Employee.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class ClientDatabase {
  ClientDatabase._privateConstructor();
  static final ClientDatabase instance = ClientDatabase._privateConstructor();
  static Database? _database;
  static const _databaseName = "employee_list_db";
  static const employeeTableName = 'employees';
  static const employeeId = 'employeeId';
  static const employeeName = 'employeeName';
  static const employeeRole = 'employeeRole';
  static const employeeJoinDate = 'employeeJoinDate';
  static const employeeEndDate = 'employeeEndDate';
  static const employeeStatus = 'employeeStatus';

  Future<Database> get database async => _database ??= await createDatabase();

  Future<Database> createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, _databaseName);
    var database = await openDatabase(dbPath, version: 1, onCreate: _onCreate);
    return database;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $employeeTableName ($employeeId INTEGER PRIMARY KEY AUTOINCREMENT,$employeeName TEXT,$employeeRole TEXT,$employeeJoinDate TEXT,$employeeEndDate TEXT,$employeeStatus INTEGER)");
    print("Created tables");
  }

  Future<int> createEmployee({required Employee getEmployee}) async {
    Database db = await instance.database;
    return await db.insert(employeeTableName, getEmployee.toMap());
  }

  Future<List<Map<String,dynamic>>> getEmployeeDB({required int getId}) async {
    Database db = await instance.database;
    return await db.rawQuery('SELECT * FROM $employeeTableName WHERE $employeeId = $getId');
  }

  Future<List<Map<String, dynamic>>> getAllEmployeeDB() async {
    Database db = await instance.database;
    return await db.rawQuery('SELECT * FROM $employeeTableName WHERE $employeeStatus = ${AppConfig().activeEmployeeStatus} ORDER BY $employeeId DESC');

  }

  Future<void> updateEmployee({required Employee getEmployee}) async{
    Database db = await instance.database;
    Map<String,dynamic> getUpdateEmployeeMap = getEmployee.toMap();
    int getEmployeeId = getEmployee.employeeId!;
    String getEmployeeName = getUpdateEmployeeMap["employeeName"];
    String getEmployeeRole = getUpdateEmployeeMap["employeeRole"];
    String getEmployeeJoinDate = getUpdateEmployeeMap["employeeJoinDate"];
    String getEmployeeEndDate = getUpdateEmployeeMap["employeeEndDate"];
    int getEmployeeStatus = getEmployee.employeeStatus;
    await db.rawUpdate('UPDATE $employeeTableName SET $employeeName = \'$getEmployeeName\',$employeeRole = \'$getEmployeeRole\',$employeeJoinDate = \'$getEmployeeJoinDate\',$employeeEndDate = \'$getEmployeeEndDate\',$employeeStatus = \'$getEmployeeStatus\' WHERE $employeeId = $getEmployeeId');
  }

  Future<void> deleteEmployee({required int getEmployeeId,required int getStatus}) async {
    Database db = await instance.database;
    await db.rawUpdate('UPDATE $employeeTableName SET $employeeStatus = $getStatus WHERE $employeeId = $getEmployeeId');
  }

  Future<List<Employee>> getAllEmployee() async{
    List<Map<String,dynamic>> allEmployeeRows = await getAllEmployeeDB();
    List<Employee> getEmployeeList = allEmployeeRows.map((getEmployee)=>Employee.fromMap(getEmployee)).toList();
    return getEmployeeList;
  }

  Future<Employee> getEmployee({required int getId}) async{
    List<Map<String,dynamic>> allEmployeeRows = await getEmployeeDB(getId: getId);
    List<Employee> getEmployeeList = allEmployeeRows.map((getEmployee)=>Employee.fromMap(getEmployee)).toList();
    return getEmployeeList[0];
  }

  Future<String> getDeleteEmployee({required int employeeId,required int status}) async{
    await deleteEmployee(getEmployeeId: employeeId, getStatus: status);
    return TextConfig().employeeListScreenEmployeeDeletedText;
  }

}