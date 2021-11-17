// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:project_management/main_app/main_Instalment/models/instalment_card_data.dart';

class MainInstalmentCard extends StatelessWidget {
  int? myIndex;
  // String startDate;
  // int dueDateFine;
  // int instalment;
  MyCurrentIndex myModel = MyCurrentIndex();

  MainInstalmentCard({
    Key? key,
    this.myIndex,
    required this.myModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xffFF66B8),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 67,
              width: 5,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: myIndex.toString(),
                                style: TextStyle(fontSize: 16)),
                            TextSpan(
                                text: ' - instalment',
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(children: [
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: String.fromCharCodes(Runes('\u0024')),
                                    style: TextStyle(
                                        color: Color(0xff7E7F81),
                                        fontSize: 16)),
                                TextSpan(
                                    text: myModel.instalment.toString(),
                                    style: TextStyle(
                                        color: Color(0xff7E7F81),
                                        fontSize: 16)),
                              ],
                            ),
                          ),
                          SizedBox(width: 15),
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Color(0xffA9BACC),
                            child: ClipRect(
                              child: Icon(Icons.done,
                                  color: Colors.white, size: 20),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                  // SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, right: 25),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Due Date: ',
                                    style: TextStyle(
                                        color: Color(0xffA880E3),
                                        fontSize: 12)),
                                TextSpan(
                                    text: myModel.startDate,
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'After Due Date: ',
                                    style: TextStyle(
                                        color: Color(0xffFBBC00),
                                        fontSize: 12)),
                                TextSpan(
                                    text: String.fromCharCodes(Runes('\u0024')),
                                    style: TextStyle(fontSize: 12)),
                                TextSpan(
                                    text: myModel.dueDateFine.toString(),
                                    style: TextStyle(fontSize: 12)),
                                TextSpan(
                                    text: ' + due amount',
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ),
                        ]),
                  ),
                  // SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
