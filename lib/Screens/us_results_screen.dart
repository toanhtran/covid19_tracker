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

    // TODO This pushes to yet another screen. There's a black/blank screen inbetween. So this needs to be resolved. Would like both the us data push and the state data push to use the same results screen.
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ResultsScreen(
        covidData: usData,
        // TODO Add a way to insert 'United States' for the screen label, like the way the states are inserted.
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
