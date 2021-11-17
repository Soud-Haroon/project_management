// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:project_management/main_app/main_project/Models/projectb_data.dart';

import '../../../const_colors.dart';

class MilestonesCard extends StatefulWidget {
  // MyMilCard myMilCard = MyMilCard();
  MileDataModel mileDataModel = MileDataModel();

  MilestonesCard({
    Key? key,
    required this.mileDataModel,
  }) : super(key: key);

  @override
  _MilestonesCardState createState() => _MilestonesCardState();
}

class _MilestonesCardState extends State<MilestonesCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Container(
        height: 155,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (widget.mileDataModel.mileName != null)
                            Text(
                              '${widget.mileDataModel.mileName}',
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
                    ],
                  ),
                  // SizedBox(height: 20.0),
                  if (widget.mileDataModel.milDes != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: SizedBox(
                        height: 39,
                        child: Text(
                          '${widget.mileDataModel.milDes}',
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                  //-------------------------------------//
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(text: 'Start Date: '),
                                TextSpan(
                                    text: widget.mileDataModel.startDate!.day.toString(),
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
                                    text: widget.mileDataModel.endDate!.day.toString(),
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
