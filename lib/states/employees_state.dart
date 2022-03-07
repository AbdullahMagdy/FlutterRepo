
import '../models/employee.dart';

abstract class ListState{
}

class LoadingState extends ListState{

}

class SuccessState extends ListState{
  List<Employee> list;
  SuccessState(this.list);
}