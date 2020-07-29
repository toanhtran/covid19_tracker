import 'package:covid19_tracker/Screens/state_select_screen.dart';
import 'package:covid19_tracker/Screens/us_results_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid19_tracker/Components/bottom_button.dart';
import 'package:covid19_tracker/us_data.dart';

class LoadScreen extends StatefulWidget {

  static const String id = 'load_screen';

  @override
  _LoadScreenState createState() => _LoadScreenState();

}

class _LoadScreenState extends State<LoadScreen> {

  // Getting the data from The COVID Tracking Project API
  Map<String, String> values = {};

  bool isWaiting = false;

  void getData() async {
    isWaiting = true;
    try {
      var data = await USData().getUSData();
      isWaiting = false;
      setState(() {
        values = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
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
                        context,
                        MaterialPageRoute(
                          builder: (context) => USResultsPage(
                            values: values,
                            isWaiting: isWaiting,
                          ),
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
