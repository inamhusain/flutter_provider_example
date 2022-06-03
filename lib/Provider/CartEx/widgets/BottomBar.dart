import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cartProvider.dart';

Container BottonBar(BuildContext context) {
  return Container(
    height: 80,
    color: Theme.of(context).primaryColor,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Grand Total",
          style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
        ),
        Consumer<ItemProvider>(
          builder: (context, value, child) {
            return Text(
              "\$${value.grandTotal}",
              style: TextStyle(fontSize: 20, color: Colors.black),
            );
          },
        ),
      ],
    ),
  );
}
