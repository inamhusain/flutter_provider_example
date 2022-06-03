import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ListProvider.dart';

// ignore: non_constant_identifier_names
Widget EmployeeList(BuildContext context) {
  return Container(
    height: 400,
    padding: EdgeInsets.all(20),
    child: ListView.builder(
      itemCount: context.read<SalaryProvider>().employeeList.length,
      itemBuilder: (BuildContext context, int index) {
        return context.read<SalaryProvider>().employeeList[index].id == 0
            ? Container()
            : ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(context
                        .read<SalaryProvider>()
                        .employeeList[index]
                        .id
                        .toString()),
                    Text(context
                        .read<SalaryProvider>()
                        .employeeList[index]
                        .name),
                    Text(
                        "₹${context.read<SalaryProvider>().employeeList[index].salary.toString()}"),
                    IconButton(
                      onPressed: () {
                        context.read<SalaryProvider>().deleteEmployee(index);
                      },
                      icon: Icon(Icons.delete),
                    )
                  ],
                ),
              );
      },
    ),
  );
}
