
import '../models/employee.dart';

abstract class AddState{
}

class AddLoadingState extends AddState{

}

class AddedState extends AddState{
  List<Employee> list;
  AddedState(this.list);
}