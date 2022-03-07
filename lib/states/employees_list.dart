import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/controllers/employee_delete_cubit.dart';
import 'package:hr_management/states/delete_state.dart';
import 'package:hr_management/states/employees_add_form.dart';
import '../controllers/employee_bloc.dart';
import 'employees_state.dart';

class EmployeesList extends StatelessWidget {
  const EmployeesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: BlocListener<EmployeeBloc,ListState>(
        listener: (context, state) {

        },
        child: Column(
      children: <Widget>[
        BlocBuilder<EmployeeBloc, ListState>(
          //todo
          bloc: BlocProvider.of<EmployeeBloc>(context)..getEmployee(),

          builder: (context, lista) {
            if (lista is SuccessState) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16),
                  itemCount: lista.list.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(Icons.account_circle),
                            title: Text(lista.list[index].name ?? ''),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                child: const Text('View Details'),
                                onPressed: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Employee Details : '),
                                    content:
                                         Text('Employee Id     : ' + lista.list[index].id.toString() + '\n'
                                              'Employee Name   : ' + lista.list[index].name.toString() + '\n'
                                              'Employee Salary : ' + lista.list[index].salary.toString()
                                         ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              TextButton(
                                child: const Text('Delete'),
                                onPressed: () {
                                  BlocProvider.of<EmployeeBloc>(context).deleteEmployee(lista.list[index]);
                                },
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
        FloatingActionButton(
          heroTag: 'btn1',
          // When the user presses the button, show an alert dialog containing
          // the text that the user has entered into the text field.
          onPressed: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EmployeesAddForm()))
          },
          tooltip: 'Show me the list!',
          child: const Icon(Icons.navigate_next),
        )
      ],
    )

    )

    );




  }
}
