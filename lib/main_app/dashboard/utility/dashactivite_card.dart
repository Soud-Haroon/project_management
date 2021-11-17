// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';

class MainDashActivitesCard extends StatelessWidget {
  MainDashActivitesCard({Key? key, required this.number, required this.Needactivite }) : super(key: key);

  int number;
  String Needactivite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: 183,
        width: 151,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 19),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 90,
              child: Text(number.toString(),
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold)),
            ),
            Container(
              decoration: BoxDecoration(
                color: Needactivite == 'Completed' ? Color(0xff1179DE) : Color(0xffA880E3),
                borderRadius: BorderRadius.circular(30),
              ),
              height: 4,
              width: 46,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text('Activities'),
            ),
            Text(Needactivite),
          ]),
        ),
      ),
    );
  }
}
