import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Theme/ThemeProvider.dart';
import '../cartProvider.dart';

// ignore: non_constant_identifier_names
AppBar MyAppBar() {
  return AppBar(
    actions: [
      Consumer(
        builder: (context, value, child) {
          return Row(
            children: [
              Container(
                child: IconButton(
                  icon: context.read<ThemeProvider>().isThemeDark == true
                      ? Icon(Icons.light_mode)
                      : Icon(Icons.dark_mode),
                  onPressed: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .changeTheme();
                  },
                ),
              ),
              Stack(
                children: [
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.pushNamed(context, '/CartScreen');
                      },
                    ),
                  ),
                  Positioned(
                    child: CircleAvatar(
                      radius: 10,
                      child: Consumer<ItemProvider>(
                        builder: (context, value, child) {
                          return Text(value.cartItemList.length.toString());
                        },
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        },
      ),
    ],
  );
}
