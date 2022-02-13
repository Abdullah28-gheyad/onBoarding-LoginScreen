import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigateToAndReplacement(context, widget) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}
