import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {

  BottomButton({@required this.onPressed, @required this.buttonTitle});

  final Function onPressed;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        '$buttonTitle',
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      height: 40.0,
      onPressed: onPressed,
    );
  }
}

//class BottomButton extends StatelessWidget {
//
//  BottomButton({@required this.onTap, @required this.buttonTitle});
//
//  final Function onTap;
//  final String buttonTitle;
//
//  @override
//  Widget build(BuildContext context) {
//    return GestureDetector(
//      onTap: onTap,
//      child: Container(
//        child: Center(
//            child: Text(
//                buttonTitle,
//                style: kLargeButtonTextStyle)),
//        color: kBottomContainerColor,
//        margin: EdgeInsets.only(top: 10.0),
//        padding: EdgeInsets.only(bottom: 20.0),
//        width: double.infinity,
//        height: kBottomContainerHeight,
//      ),
//    );
//  }
//}