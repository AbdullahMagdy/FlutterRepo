
import 'package:hr_management/models/employee.dart';

enum EventType {add}

class EmployeeEvent {

  Employee employee;

  EventType? eventType;

  EmployeeEvent.add(this.employee){
    eventType = EventType.add;
  }

}