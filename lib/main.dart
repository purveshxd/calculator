import 'package:flutter/material.dart';
import 'package:full_calculator/button_grid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.dark;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light, useMaterial3: true),
      darkTheme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
      themeMode: themeMode,
      home: ButtonGrid(
        buttonTap: () {
          setState(() {
            if (themeMode == ThemeMode.light) {
              themeMode = ThemeMode.dark;
              print(themeMode.name);
            } else {
              themeMode = ThemeMode.light;
              print(themeMode.name);
            }
          });
        },
      ),
    );
  }
}
