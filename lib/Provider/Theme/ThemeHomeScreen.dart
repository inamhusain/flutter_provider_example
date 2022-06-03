import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ThemeProvider.dart';

class ThemeHomeScreen extends StatefulWidget {
  const ThemeHomeScreen({Key? key}) : super(key: key);

  @override
  _ThemeHomeScreenState createState() => _ThemeHomeScreenState();
}

class _ThemeHomeScreenState extends State<ThemeHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer(
            builder: (context, value, child) {
              return Container(
                child: IconButton(
                  icon: context.read<ThemeProvider>().isThemeDark == true
                      ? Icon(Icons.light_mode)
                      : Icon(Icons.dark_mode),
                  onPressed: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .changeTheme();
                  },
                ),
              );
            },
          )
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(),
    );
  }
}
