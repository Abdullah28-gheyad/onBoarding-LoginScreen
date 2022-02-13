import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customTextButton(
{
  required String text ,
  required Function? onPress ,
  Color color = Colors.orange ,

}
    ) => TextButton(onPressed: () {
      onPress!();
}, child: Text(text,style: TextStyle(color: color),));
