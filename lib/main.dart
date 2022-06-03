import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/CartEx/cartProvider.dart';
import 'Provider/CartEx/cartScreen.dart';
import 'Provider/CartEx/itemListScreen.dart';
import 'Provider/Counter/CounterProvider.dart';
import 'Provider/Counter/CounterScreen.dart';
import 'Provider/Employee_providerExample/ListAddScreen.dart';
import 'Provider/Employee_providerExample/ListProvider.dart';
import 'Provider/Theme/ThemeData.dart';
import 'Provider/Theme/ThemeHomeScreen.dart';
import 'Provider/Theme/ThemeProvider.dart';
import 'Provider/Timer/TimerInfo.dart';
import 'Provider/Timer/timerScreeen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TimerInfo(),
        ),
        ChangeNotifierProvider(
          create: (context) => SalaryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ItemProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        return MaterialApp(
          // debugShowMaterialGrid: true,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: context.read<ThemeProvider>().isThemeDark == true
              ? darkTheme
              : lightTheme,
          initialRoute: "/",
          routes: {
            "/CounterScreen": (context) => CounterScreen(),
            "/timerScreen": (context) => TimerScreen(),
            "/ListScreen": (context) => ListAddScreen(),
            "/ThemeHomeScreen": (context) => ThemeHomeScreen(),
            "/": (context) => ItemListScreen(),
            "/CartScreen": (context) => CartScreen(),
          },
        );
      },
    );
  }
}

//sdfsdf 