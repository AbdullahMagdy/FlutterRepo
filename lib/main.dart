// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/Repository/employees_data.dart';
import 'package:hr_management/controllers/employee_delete_cubit.dart';
import 'package:hr_management/states/employees_add_form.dart';
import 'package:hr_management/states/employees_list.dart';
import 'package:provider/provider.dart';
import 'controllers/employee_bloc.dart';
import 'controllers/employee_cubit.dart';

void main() => runApp(const FlutterApp());

class FlutterApp extends StatelessWidget {
  const FlutterApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EmployeeBloc>(
          create: (context) => EmployeeBloc(),
        ),

        BlocProvider<AddingCubit>(
          create: (context) => AddingCubit(),
        ),
        BlocProvider<DeleteCubit>(
            create: (context) => DeleteCubit(),
        )
      ],
      child: Provider(
        create: (context) => EmployeesData(),
        child:   MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Employees List Screen',
          home: Scaffold(
            appBar: AppBar(
              title: const Text('HR Employees Management'),
              backgroundColor: Colors.orange[600],
            ),
            body: const EmployeesList(),
          ),
          routes: {
            '/welcomePage': (context) => const EmployeesAddForm(),
          },
          //initialRoute: '/welcomePage',
        ),
      )


    );

  }
}
