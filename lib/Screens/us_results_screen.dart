import 'package:flutter/material.dart';
import 'package:covid19_tracker/Screens/results_screen.dart';
import 'package:covid19_tracker/Services/covid_tracking.dart';

class USResultsScreen extends StatefulWidget {
  static const String id = 'us_results_screen';

  @override
  _USResultsScreenState createState() => _USResultsScreenState();
}

class _USResultsScreenState extends State<USResultsScreen> {
  void initState() {
    super.initState();
    getUSData();
  }

  void getUSData() async {
    var usData = await CovidTracking().getUSData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ResultsScreen(
        covidData: usData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
