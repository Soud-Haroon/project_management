// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:project_management/main_app/main_project/Models/projectb_data.dart';
import '../../../const_colors.dart';

class MainProjectBCard extends StatefulWidget {
  ProjectDetailModel projectDM = ProjectDetailModel();

  MainProjectBCard({Key? key, required this.projectDM}) : super(key: key);

  @override
  State<MainProjectBCard> createState() => _MainProjectBCardState();
}

class _MainProjectBCardState extends State<MainProjectBCard> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 155,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
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
                          if (widget.projectDM.projectName!.isNotEmpty)
                            Text(
                              widget.projectDM.projectName!,
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
                      if (widget.projectDM.description!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 5),
                          child: SizedBox(
                            height: 39,
                            child: Text(
                              widget.projectDM.description!,
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
                                    TextSpan(
                                        text: '${widget.projectDM.startDate!.day}/' +
                                            '${widget.projectDM.startDate!.month}/' +
                                            '${widget.projectDM.startDate!.year}'),
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
                                    TextSpan(
                                        text: '${widget.projectDM.endDate!.day}/' +
                                            '${widget.projectDM.endDate!.month}/' +
                                            '${widget.projectDM.endDate!.year}'),
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
                                style: TextStyle(color: Color(0xffFF66B8))),
                            // TextSpan(text: widget.milestones.toString()),
                          ],
                        ),
                      ),
                    ]),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

//===============================================================//

