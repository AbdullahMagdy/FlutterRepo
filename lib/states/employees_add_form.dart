import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/controllers/employee_cubit.dart';
import 'package:hr_management/models/employee.dart';
import 'package:hr_management/states/adding_state.dart';
import 'package:hr_management/states/employees_list.dart';

import '../controllers/employee_bloc.dart';

void main() => runApp(const EmployeesAddForm());

class EmployeesAddForm extends StatefulWidget {
  const EmployeesAddForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyApp();
}

class MyApp extends State<EmployeesAddForm> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Hi, Here you can add Employee';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myFirstController = TextEditingController();
    final mySecondController = TextEditingController();
    final idController = TextEditingController();

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      myFirstController.dispose();
      mySecondController.dispose();
      idController.dispose();
    }

    return Scaffold(
      body: BlocListener<AddingCubit, AddState>(
        // bloc: AddingCubit(),
        listener: (context, state) {
          if (state is AddedState) {
            print("success");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const EmployeesList()));
          }
          if (state is AddLoadingState) {
            print("loading");
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Loading ... '))
            );

          }
        },
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Employee Id',
              ),
              controller: idController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Employee Name',
              ),
              controller: myFirstController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Employee Salary',
              ),
              controller: mySecondController,
            ),
          ),

          TextButton(
            // When the user presses the button, show an alert dialog containing
            // the text that the user has entered into the text field.
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.teal,
              onSurface: Colors.grey,
            ),

            onPressed: () {
              BlocProvider.of<AddingCubit>(context).addEmployee(Employee(
                  int.parse(idController.text),
                  myFirstController.text,
                  double.parse(mySecondController.text)));
            },
            //tooltip: 'Save new Employee',
            child:const Text('Save Employee') ,//const Icon(Icons.save),
          ),
          /*
          FloatingActionButton(
            heroTag: 'btn2',
            // When the user presses the button, show an alert dialog containing
            // the text that the user has entered into the text field.
            onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EmployeesList()))
            },
            tooltip: 'Show me the list!',
            child: const Icon(Icons.navigate_before),
          ),

           */
        ]),
      ),
    );
  }
}
