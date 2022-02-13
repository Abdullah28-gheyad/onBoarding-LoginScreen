import 'package:advancedcourse/models/onboard_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildBoardingItem (OnBoardModel boardModel)
{
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            boardModel.title ,
            style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold),
          ),
        ) ,
        SizedBox(height: 10,) ,
        Center(
          child: Text(
            boardModel.subTitle ,
            style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20,) ,
        Expanded(child: Center(
          child: SvgPicture.asset(
              boardModel.image),
        )  ) ,
      ],
    ),
  ) ;
}