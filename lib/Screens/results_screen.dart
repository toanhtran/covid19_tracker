import 'package:covid19_tracker/Services/covid_tracking.dart';
import 'package:flutter/material.dart';
import 'package:covid19_tracker/Components/bottom_button.dart';
import 'package:covid19_tracker/Screens/state_select_screen.dart';
import 'package:covid19_tracker/Components/main_box_results.dart';

class ResultsScreen extends StatefulWidget {
  static const String id = 'results_screen';

  ResultsScreen({this.covidData});

  final covidData;

  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  CovidTracking covidTracking = CovidTracking();
  var positive;
  var positiveIncrease;
  var hospitalizedCumulative;
  var hospitalizedCurrently;
  var inIcuCumulative;
  var inIcuCurrently;
  var death;
  var deathIncrease;
  var lastModified;

  @override
  void initState() {
    super.initState();

    updateUI(widget.covidData);
  }

  void updateUI(dynamic currentData) {
    setState(() {
      if (currentData == null) {
        positive = 'U/A';
        positiveIncrease = 'U/A';
        hospitalizedCumulative = 'U/A';
        hospitalizedCurrently = 'U/A';
        inIcuCumulative = 'U/A';
        inIcuCurrently = 'U/A';
        death = 'U/A';
        deathIncrease = 'U/A';
        lastModified = 'U/A';
      } else {
        positive = currentData['positive'];
        positiveIncrease = currentData['positiveIncrease'];
        hospitalizedCumulative = currentData['hospitalizedCumulative'];
        hospitalizedCurrently = currentData['hospitalizedCurrently'];
        inIcuCumulative = currentData['inIcuCumulative'];
        inIcuCurrently = currentData['inIcuCurrently'];
        death = currentData['death'];
        deathIncrease = currentData['deathIncrease'];
        lastModified = currentData['lastModified'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('COVID-19 Tracker'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      height: 60.0,
                      child: Image.asset('images/trackerlogo.png'),
                    ),
                  ),
//                  Expanded(
//                    child: Text(
//                      widget.isWaiting ? '?' : USStates.getName(widget.values['state']),
//                      textAlign: TextAlign.center,
//                      style: TextStyle(
//                        fontSize: 40.0,
//                        fontWeight: FontWeight.bold,
//                      ),
//                    ),
//                  ),
                ],
              ),
            ),
            ResultsMainBox(
              totalConfirmed: positive.toString(),
              caseIncrease24H: positiveIncrease.toString(),
              totalHospitalized: hospitalizedCumulative.toString(),
              currentlyHospitalized: hospitalizedCurrently.toString(),
              totalICU: inIcuCumulative.toString(),
              currentlyICU: inIcuCurrently.toString(),
              totalDeath: death.toString(),
              deathIncrease24H: deathIncrease.toString(),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: <Widget>[
                  Text(
                    'This states data was last updated on:',
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                  Text(
                    lastModified,
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: <Widget>[
                  Text(
                    'Data obtained from The COVID Tracking Project',
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                  Text(
                    'https://covidtracking.com',
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            BottomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StateSelectPage(),
                  ),
                );
              },
              buttonTitle: 'Check a US State',
            ),
          ],
        ),
      ),
    );
  }
}
