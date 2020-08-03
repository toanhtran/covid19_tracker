import 'package:flutter/material.dart';
import 'package:covid19_tracker/Components/bottom_button.dart';
import 'package:us_states/us_states.dart';
import 'package:covid19_tracker/Components/main_box_results.dart';

class StateResultsPage extends StatelessWidget {

  // TODO This page is still using the "old" way of calling the data, it needs to be modified to use the new networking methods.
  static const String id = 'state_results_screen';

  StateResultsPage({this.values, this.isWaiting});

  final Map<String, String> values;
  final bool isWaiting;

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
                  Expanded(
                    child: Text(
                      isWaiting ? '?' : USStates.getName(values['state']),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ResultsMainBox(
              totalConfirmed: isWaiting ? '?' : (values['positive']),
              caseIncrease24H: isWaiting ? '?' : (values['positiveIncrease']),
              totalHospitalized: isWaiting ? '?' : (values['hospitalizedCumulative']),
              currentlyHospitalized: isWaiting ? '?' : (values['hospitalizedCurrently']),
              totalICU: isWaiting ? '?' : (values['inIcuCumulative']),
              currentlyICU: isWaiting ? '?' : (values['inIcuCurrently']),
              totalDeath: isWaiting ? '?' : (values['death']),
              deathIncrease24H: isWaiting ? '?' : (values['deathIncrease']),
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
                    isWaiting ? '?' : values['lastUpdateEt'],
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
                Navigator.pop(context);
              },
              buttonTitle: 'Check Another State',
            ),
          ],
        ),
      ),
    );
  }
}


