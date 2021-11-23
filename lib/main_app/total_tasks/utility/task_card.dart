// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:project_management/main_app/main_project/Models/projectb_data.dart';

import '../../../utility/const_colors.dart';

class TotalTaskCard extends StatefulWidget {
  // int myIndex;
  ProjectDetailModel? projectDetailModel;
  int? index;
  int? builderIndex;

  TotalTaskCard({
    Key? key,
    // required this.myIndex,
    this.projectDetailModel,
    this.index,
    this.builderIndex,
  }) : super(key: key);

  @override
  _TotalTaskCardState createState() => _TotalTaskCardState();
}

class _TotalTaskCardState extends State<TotalTaskCard> {
  @override
  Widget build(BuildContext context) {
    var _taskVariable = widget.projectDetailModel!.milestone[widget.index!].taskList[widget.index!];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
              height: 100,
              width: 7,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${_taskVariable.taskTitle}',
                        style: TextStyle(
                          //color red
                          // fontWeight: FontWeight.bold,
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
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 4, right: 25),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(text: 'Start Date: '),
                                TextSpan(
                                    text:
                                        '${_taskVariable.startDate!.day}-'
                                        '${_taskVariable.startDate!.month}-'
                                        '${_taskVariable.startDate!.year}',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(text: 'End Date: '),
                                TextSpan(
                                    text:
                                        '${_taskVariable.endDate!.day}-'
                                        '${_taskVariable.endDate!.month}-'
                                        '${_taskVariable.endDate!.year}',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
