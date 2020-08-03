import 'package:covid19_tracker/Screens/state_select_screen.dart';
import 'package:covid19_tracker/Screens/us_results_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid19_tracker/Components/bottom_button.dart';

class SelectScreen extends StatefulWidget {
  static const String id = 'select_screen';

  @override
  _SelectScreenState createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
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
                        context,
                        MaterialPageRoute(
                          builder: (context) => USResultsScreen(),
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
                          builder: (context) => StateSelectPage(),
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
