import 'package:covid19_tracker/Screens/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:covid19_tracker/Screens/menu_screen.dart';
import 'package:covid19_tracker/Screens/state_select_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0908),
        cupertinoOverrideTheme: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            pickerTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
          ),
        ),
      ),
      initialRoute: MenuScreen.id,
      routes: {
        MenuScreen.id: (context) => MenuScreen(),
        StateSelectScreen.id: (context) => StateSelectScreen(),
        ResultsScreen.id: (context) => ResultsScreen(),
      },
    );
  }
}
