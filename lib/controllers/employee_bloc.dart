
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/models/employee.dart';
import '../Repository/employees_data.dart';
import '../states/employees_state.dart';

 EmployeesData employeesData = EmployeesData();

class EmployeeBloc extends Cubit<ListState>{

  // EmployeesData employeesData=EmployeesData();

  EmployeeBloc() : super(LoadingState());

  void getEmployee(){

    List<Employee> list = employeesData.listOfEmployees;
    print('before get emit ' + list.length.toString());
    var timer = Timer(const Duration(seconds: 3), () => emit(SuccessState(list)));
    print('after get emit ' + list.length.toString());

  }

  void deleteEmployee (Employee employee){
    List<Employee> list = employeesData.getList();
    list.remove(employee);
    emit(SuccessState(list));
  }
}
