import 'package:flutter/material.dart';

class MainBoxRow extends StatelessWidget {

  MainBoxRow({this.category, this.value});

  final String category;
  final String value;

@override
Widget build(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        '$category :'.toUpperCase(),
        style: TextStyle(
          fontSize: 22.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      Text(
        // TODO: This isn't working right. Some values still appear as 'null' in the app.
        value != null ? '$value' : 'U/A',
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w700,
          color: Colors.red,
        ),
      ),
    ],
  );
}
}
