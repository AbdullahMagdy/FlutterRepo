import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/controllers/employee_bloc.dart';
import 'package:hr_management/models/employee.dart';

import '../states/delete_state.dart';



class DeleteCubit extends Cubit<DeleteState>{

  DeleteCubit() : super(LoadingDeleteState());

  void deleteEmployee (Employee employee){
    List<Employee> list = employeesData.getList();
    list.remove(employee);
    emit(SuccessDeleteState(list));
  }

}

