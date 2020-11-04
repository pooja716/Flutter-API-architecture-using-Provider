import 'package:flutter/material.dart';

import 'package:flutterapiarchitecture/provider/GetAllEmployeeProvider.dart';
import 'package:flutterapiarchitecture/widgets/GenericWidget.dart';

import 'package:flutterapiarchitecture/widgets/TextInfo.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [TextInfo('Name'), TextInfo('Salary'), TextInfo('Age')],
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: SafeArea(child: GetEmployee(context)),
      ),
    );
  }

  Widget GetEmployee(BuildContext context) {
    return Consumer<GetAllEmployeeProvider>(
        builder: (context, getAllEmployee, child) {
      return GenericWidget(
          status: getAllEmployee.employeeList.status,
          errMsg: getAllEmployee.employeeList.message,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: getAllEmployee.employeeList.data != null
                  ? getAllEmployee.employeeList.data.data.length
                  : 0,
              itemBuilder: (BuildContext ctxt, int index) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextInfo(getAllEmployee
                          .employeeList.data.data[index].employee_name),
                      TextInfo(getAllEmployee
                          .employeeList.data.data[index].employee_salary),
                      TextInfo(getAllEmployee
                          .employeeList.data.data[index].employee_age),
                      MaterialButton(
                        onPressed: () {},
                        child: const Text('Update'),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        child: const Text('Delete'),
                      )
                    ],
                  ),
                );
              }));
    });
  }
}
