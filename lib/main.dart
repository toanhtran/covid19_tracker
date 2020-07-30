import 'package:covid19_tracker/Screens/us_results_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:covid19_tracker/Screens/load_screen.dart';
import 'package:covid19_tracker/Screens/state_select_screen.dart';
import 'package:covid19_tracker/Screens/state_results_screen.dart';

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
      initialRoute: LoadScreen.id,
      routes: {
        LoadScreen.id: (context) => LoadScreen(),
        StateSelectPage.id: (context) => StateSelectPage(),
        StateResultsPage.id: (context) => StateResultsPage(),
        USResultsScreen.id: (context) => USResultsScreen(),
      },
    );
  }
}
