import 'dart:ui';

import 'package:flutter/material.dart';

class CustomElevatedbutton extends StatelessWidget {
  final String text;
  final double width;

  CustomElevatedbutton(this.text, this.width,);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton( 
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.amber),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
        ),
        onPressed: () {},
        child: Text(text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
