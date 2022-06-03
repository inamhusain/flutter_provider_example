import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ListProvider.dart';

// ignore: non_constant_identifier_names
Container BottomContainer() {
  return Container(
    height: 80,
    color: Colors.blue,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'GrandTotal',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Consumer<SalaryProvider>(
          builder: (context, value, child) {
            return Text(
              context.read<SalaryProvider>().getGrandSalary.toString(),
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            );
          },
        )
      ],
    ),
  );
}
