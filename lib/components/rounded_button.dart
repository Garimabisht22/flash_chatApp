import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(this.colour,this.screenId,this.text);
  final String text;
  final Color colour;
  final String screenId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        // color: Colors.amberAccent,
        color: this.colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, this.screenId);
            //Go to login screen.
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
