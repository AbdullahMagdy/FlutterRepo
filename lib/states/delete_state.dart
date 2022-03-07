

import '../models/employee.dart';

abstract class DeleteState{

}

class SuccessDeleteState extends DeleteState{
  List<Employee> list;
  SuccessDeleteState(this.list);
}

class LoadingDeleteState extends DeleteState{

}