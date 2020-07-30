import 'package:covid19_tracker/Components/bottom_button.dart';
import 'package:covid19_tracker/Screens/state_results_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:covid19_tracker/state_data.dart';
import 'package:us_states/us_states.dart';
import 'dart:io' show Platform;

// TODO: Eliminate the state and us results page and use just one. This page will be refactored to 'LocationSelect' or something.
// TODO: 'state_results_screen' will be refactored to 'results_screen' as will subsequent methods.
// TODO: ADD the 'United States' to the picker and have the picker start there and put the states below. Tried this previously but it didn't work. Could be possible with the new networking setup.

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
          getData();
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
          getData();
        });
      },
      children: pickerItems,
    );
  }

  // Getting the data from The COVID Tracking Project API
  Map<String, String> values = {};

  bool isWaiting = false;

  void getData() async {
    isWaiting = true;
    try {
      var data = await StateData().getStateData(selectedState);
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

  void updateUI() {
    // TODO: Create this! Additional formatting will need to be done within the build method? Need ideas for this.
  }

  // TODO: Fix formatting so the logo stays the same size from the load screen to this screen.
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
                    onPressed: () {
//                      Navigator.pushNamed(
//                        context,
//                        StateResultsPage.id,
//                        arguments: {values, isWaiting},
//                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StateResultsPage(
                            values: values,
                            isWaiting: isWaiting,
                          ),
                        ),
                      );
                    },
                    buttonTitle: 'Check State Results',
                  ),
                  SizedBox(height: 15.0,),
                  BottomButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    buttonTitle: 'Back to Main',
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
