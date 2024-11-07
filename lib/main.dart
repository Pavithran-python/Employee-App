import 'package:employee/Config/ColorConfig.dart';
import 'package:employee/LocalDatabase/ClientDatabase.dart';
import 'package:employee/Pages/EmployeeFlow/EmployeeBloc/employee_bloc.dart';
import 'package:employee/Pages/EmployeeFlow/EmployeeListBloc/employee_list_bloc.dart';
import 'package:employee/Pages/EmployeeFlow/EmployeeListScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  var dbHelper = ClientDatabase.instance;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EmployeeListBloc>(create: (context)=>EmployeeListBloc()..add(LoadEmployeeList(loader: true))),
        BlocProvider<EmployeeBloc>(create: (context)=>EmployeeBloc()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double screenWidth = 0;
  double screenHeight = 0;


  navigateToEmployeeListScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeListScreen())).then((value){
      SystemNavigator.pop();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterNativeSplash.remove();
    Future.delayed(const Duration(milliseconds: 100)).then((value){
      navigateToEmployeeListScreen();
    });
  }


  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: ColorConfig().appBarBackgroundColor,
      ),
    );
  }
}
