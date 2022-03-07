
import '../models/employee.dart';

class EmployeesData {

  List<Employee> listOfEmployees = [
    Employee(1, 'Ahmed', 15000),
    Employee(2, 'Ali', 17000)
  ];

  List<Employee> addToList(Employee employee){
    listOfEmployees.add(employee);
    return listOfEmployees;
  }

  List<Employee> getList(){
    return listOfEmployees;
  }

}

