import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ListProvider.dart';

// ignore: non_constant_identifier_names
FloatingActionButton FloatingActionBtn(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      context.read<SalaryProvider>().visible();
    },
    child: Consumer<SalaryProvider>(
      builder: (context, value, child) {
        return context.read<SalaryProvider>().isvisible == false
            ? Icon(Icons.add)
            : Icon(Icons.remove);
      },
    ),
  );
}
