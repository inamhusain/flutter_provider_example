import 'package:flutter/material.dart';

import '../ListProvider.dart';
import 'package:provider/provider.dart';

// ignore: non_constant_identifier_names
Container AddEmployeeSection(BuildContext context) {
  TextEditingController nameController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  return Container(
    padding: EdgeInsets.all(20),
    height: 250,
    width: double.infinity,
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(
          flex: 1,
        ),
        Text(
          'ADD EMPLOYEE',
          style: TextStyle(
              color: Colors.blue,
              letterSpacing: 2,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        Spacer(flex: 2),
        TextField(
          controller: nameController,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            hintText: "Enter Name",
            contentPadding: EdgeInsets.all(10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
          ),
        ),
        Spacer(),
        TextField(
          controller: salaryController,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            hintText: "Enter Salary",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
          ),
        ),
        Spacer(
          flex: 2,
        ),
        InkWell(
          onTap: () {
            context.read<SalaryProvider>().addUser(
                name: nameController.text,
                salary: double.parse(salaryController.text));
            nameController.text = '';
            salaryController.text = '0';
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: Text(
              "ADD EMPLOYEEE",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ),
          ),
        ),
        Spacer(),
      ],
    ),
  );
}
