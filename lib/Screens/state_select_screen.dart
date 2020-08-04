import 'package:covid19_tracker/Components/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:covid19_tracker/state_data.dart';
import 'package:us_states/us_states.dart';
import 'package:covid19_tracker/Services/covid_tracking.dart';
import 'package:covid19_tracker/Screens/results_screen.dart';
import 'package:covid19_tracker/Screens/select_screen.dart';
import 'dart:io' show Platform;

class StateSelectPage extends StatefulWidget {
  static const String id = 'state_select_screen';

  @override
  _StateSelectPageState createState() => _StateSelectPageState();
}

class _StateSelectPageState extends State<StateSelectPage> {
  String selectedState = 'ak';
  bool showSpinner = false;

  // Android Dropdown
  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String state in statesList) {
      var newItem = DropdownMenuItem(
        child: Text(
          USStates.getName(state).toUpperCase(),
          textAlign: TextAlign.center,
        ),
        value: state,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
      dropdownColor: Colors.black26,
      autofocus: true,
      focusColor: Colors.black26,
      style: TextStyle(
        fontSize: 30.0,
      ),
      value: selectedState,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedState = value;
          getStateData();
        });
      },
    );
  }

  // iOS Picker
  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String state in statesList) {
      pickerItems.add(Text(USStates.getName(state.toUpperCase())));
    }

    return CupertinoPicker(
      backgroundColor: Colors.black26,
      itemExtent: 35.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedState = statesList[selectedIndex];
          getStateData();
        });
      },
      children: pickerItems,
    );
  }

  Map<String, dynamic> selectedStateData = {};
  bool isWaiting = false;

  // Getting the data from The COVID Tracking Project API
  void getStateData() async {
    isWaiting = true;
    try {
      var stateData = await CovidTracking().getStateData(selectedState);
      isWaiting = false;
      setState(() {
        selectedStateData = stateData;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getStateData();
  }

  // Build Method
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
                  Container(
                    height: 100.0,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Platform.isIOS ? iOSPicker() : androidDropdown(),
                  ),
                  BottomButton(
                    // TODO PushNamed here, please
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ResultsScreen(
                              covidData: selectedStateData,
                            );
                          },
                        ),
                      );
                    },
                    buttonTitle: 'Check State Results',
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  BottomButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SelectScreen.id);
                    },
                    buttonTitle: 'Main Menu',
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
