// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import '../../../utility/const_colors.dart';

class MainDashBoardCard extends StatefulWidget {
  String header;
  String bodyContent;
  String startDate;
  String endDate;
  int milestones;

  MainDashBoardCard({
    Key? key,
    required this.header,
    required this.bodyContent,
    required this.startDate,
    required this.endDate,
    required this.milestones,
  }) : super(key: key);

  @override
  State<MainDashBoardCard> createState() => _MainDashBoardCardState();
}

class _MainDashBoardCardState extends State<MainDashBoardCard> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Container(
        height: 155,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  decoration: BoxDecoration(
                    color: selected == false ? Color(0xffFF66B8) : Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 100,
                  width: 7,
                ),
                SizedBox(width: 20),
                //========================================//
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.header}',
                              style: TextStyle(
                                //color red
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Container(
                                  height: 27,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: kInProgressColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text('IN PROGRESS',
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.white)),
                                  )),
                            ),
                          ],
                        ),
                        // SizedBox(height: 20.0),
                        if (widget.bodyContent.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 5),
                            child: SizedBox(
                              height: 39,
                              child: Text(
                                '${widget.bodyContent}',
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 2, bottom: 4, right: 25),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Start Date: ',
                                          style: TextStyle(
                                              color: Color(0xffA880E3))),
                                      TextSpan(text: widget.startDate),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'End Date: ',
                                          style: TextStyle(
                                              color: Color(0xffFBBC00))),
                                      TextSpan(text: widget.endDate),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                        // SizedBox(height: 30),
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Milstones:   ',
                                  style: TextStyle(
                                      color: Color(0xffFF66B8))),
                              TextSpan(text: widget.milestones.toString()),
                            ],
                          ),
                        ),
                      ]),
                ),
              ]),
              //==============================================================//
              
            ],
          ),
        ),
      ),
    );
  }
}
