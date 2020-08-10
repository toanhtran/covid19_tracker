import 'package:covid19_tracker/Screens/state_select_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid19_tracker/Components/bottom_button.dart';
import 'package:covid19_tracker/Screens/results_screen.dart';
import 'package:covid19_tracker/Services/covid_tracking.dart';

/// Initial screen of app with selections to get US Covid-19 data or US State Covid-19 data
class MenuScreen extends StatefulWidget {
  static const String id = 'select_screen';

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
    getUSData();
  }

  Map<String, dynamic> selectedUSData = {};
  bool isWaiting = false;

  void getUSData() async {
    isWaiting = true;
    try {
      var usData = await CovidTracking().getUSData();
      isWaiting = false;
      setState(() {
        selectedUSData = usData;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Tracker'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(top: 100.0, bottom: 100.0),
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/trackerlogo.png'),
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  BottomButton(
                    onPressed: () {
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) {
                        return ResultsScreen(
                          covidData: selectedUSData,
                        );
                      },
                      ),
                      );
                    },
                    buttonTitle: 'US Data',
                  ),
                  SizedBox(height: 15.0,),
                  BottomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StateSelectScreen(),
                        ),
                      );
                    },
                    buttonTitle: 'States Data',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
