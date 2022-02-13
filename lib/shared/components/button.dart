import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customButton({
  required String text,
  required Function? function,
   Color color=Colors.orange,
   double width=double.infinity,
   double height=40,
}) {
  return Container(
    width: width,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color:color ,
    ),
    child: MaterialButton(
      onPressed: () {
        function!();
      },
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
      ),
    ),
  );
}
