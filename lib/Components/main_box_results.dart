import 'package:flutter/material.dart';
import 'package:covid19_tracker/Components/main_box_row.dart';

class ResultsMainBox extends StatelessWidget {

  ResultsMainBox({this.totalConfirmed, this.caseIncrease24H, this.totalHospitalized,
    this.currentlyHospitalized, this.totalICU, this.currentlyICU, this.totalDeath, this.deathIncrease24H});

  final String totalConfirmed;
  final String caseIncrease24H;
  final String totalHospitalized;
  final String currentlyHospitalized;
  final String totalICU;
  final String currentlyICU;
  final String totalDeath;
  final String deathIncrease24H;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.black45
      ),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          MainBoxRow(category: 'confirmed cases', value: totalConfirmed,),
          MainBoxRow(category: 'deaths', value: totalDeath,),
          MainBoxRow(category: 'hospitalizations', value: totalHospitalized,),
          MainBoxRow(category: 'icu admissions', value: totalICU,),
          SizedBox(height: 30.0,),
          Text('LAST 24 HOURS',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),),
          SizedBox(height: 5.0,),
          MainBoxRow(category: 'confirmed cases', value: caseIncrease24H,),
          MainBoxRow(category: 'deaths', value: deathIncrease24H,),
          MainBoxRow(category: 'hospitalizations', value: currentlyHospitalized,),
        ],
      ),
    );
  }
}