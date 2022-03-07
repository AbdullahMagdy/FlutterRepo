
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/models/employee.dart';
import 'package:hr_management/states/adding_state.dart';
import '../Repository/employees_data.dart';
import '../states/employees_state.dart';
import 'employee_bloc.dart';


class AddingCubit extends Cubit<AddState>{

  late bool added;

  AddingCubit() : super(AddLoadingState());

  void addEmployee(Employee employee){

    emit(AddLoadingState());
    List<Employee> list = employeesData.addToList(employee);
    print('before add emit ' + list.length.toString());
    var timer = Timer(const Duration(seconds: 3), () => emit(AddedState(list)));
    print('after add emit ' + list.length.toString());

  }

}
