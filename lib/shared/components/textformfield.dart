import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customTextFormField(
{
  required TextEditingController controller,
  required String label,
  required TextInputType type,
  required Function validate ,
   bool secure=false,
}
    )
{
  return TextFormField(
    controller: controller,
    keyboardType: type,
    obscureText: secure,
    validator: (String? value){
      validate(value);
    },
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ) ,
      label: Text(label) ,
    ),
  ) ;
}