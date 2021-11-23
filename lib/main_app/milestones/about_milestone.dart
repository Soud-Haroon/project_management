// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unnecessary_string_interpolations, camel_case_types

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_management/main_app/appbar/appbar.dart';
import 'package:project_management/main_app/create_milestone/create_mileform.dart';
import 'package:project_management/main_app/main_project/Models/projectb_data.dart';
import 'package:project_management/main_app/total_tasks/main_task.dart';
import 'dart:math' as math;
import '../../utility/const_colors.dart';

class Milestone_of_Project extends StatelessWidget {
  Milestone_of_Project({this.milestoneData, this.myIndex, Key? key})
      : super(key: key);

  ProjectDetailModel? milestoneData;
  int? myIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildMyAppBar(
          context,
          '${milestoneData!.milestone[myIndex!].mileName.toString()}',
          false,
          true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //=====================================//
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(milestoneData!.milestone[myIndex!].mileName.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: Color(0xff3C3C3C))),
                  //--------------------------------------------//
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyCreateMileForm(projectModel: milestoneData,myIndex: myIndex,edit: true)));
                    },
                    icon: Icon(Icons.edit_outlined, color: kPrimaryOrange),
                  ),
                ],
              ),
              //===================================//
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: milestoneData!
                                      .milestone[myIndex!].taskList.length
                                      .toString() ==
                                  '0'
                              ? Text(
                                  "Tasks: (0${milestoneData!.milestone[myIndex!].taskList.length})")
                              : milestoneData!.milestone[myIndex!].taskList
                                          .length <=
                                      9
                                  ? Text(
                                      "Tasks: (0${milestoneData!.milestone[myIndex!].taskList.length})")
                                  : Text(
                                      "Tasks: (${milestoneData!.milestone[myIndex!].taskList.length})"),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MainTotalTasks(
                                    projectDetailModel: milestoneData,
                                    myIndex: myIndex)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: CircleAvatar(
                              backgroundColor: kPrimaryOrange,
                              child: Icon(Icons.arrow_forward_ios_outlined,
                                  color: Colors.black, size: 15),
                            ),
                          ),
                        )
                      ]),
                ),
              ),
              //===================================//
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (milestoneData!.milestone[myIndex!].mileName!.isNotEmpty)
                      Text('Status:'),
                    Container(
                        height: 27,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: milestoneData!.milestone[myIndex!].statusValue
                                      .toString() ==
                                  'Status.inprogress'
                              ? kInProgressColor
                              : milestoneData!.milestone[myIndex!].statusValue
                                          .toString() ==
                                      'Status.onHold'
                                  ? Colors.orange[300]
                                  : milestoneData!
                                              .milestone[myIndex!].statusValue
                                              .toString() ==
                                          'Status.done'
                                      ? Colors.green[200]
                                      : null,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                              milestoneData!.milestone[myIndex!].statusValue
                                          .toString() ==
                                      'Status.inprogress'
                                  ? 'IN PROGRESS'
                                  : milestoneData!
                                              .milestone[myIndex!].statusValue
                                              .toString() ==
                                          'Status.onHold'
                                      ? 'ON HOLD'
                                      : milestoneData!.milestone[myIndex!]
                                                  .statusValue
                                                  .toString() ==
                                              'Status.done'
                                          ? 'DONE'
                                          : 'null',
                              style:
                                  TextStyle(fontSize: 11, color: Colors.white)),
                        )),
                  ],
                ),
              ),
              //=========================================//
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Divider(color: Colors.grey[400]),
              ),
              //=========================================//
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Area:', style: TextStyle(color: Colors.grey[600])),
                      Text(milestoneData!.area.toString(),
                          style: TextStyle(color: Colors.grey[500])),
                    ]),
              ),
              //=========================================//
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Divider(color: Colors.grey[400]),
              ),
              //=========================================//
              Padding(
                padding: const EdgeInsets.only(top: 10),
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
                                    decoration: TextDecoration.none,
                                    color: Colors.grey[600],
                                    fontSize: 11)),
                            TextSpan(
                                text: '${milestoneData!.milestone[myIndex!].startDate!.day.toString()}-' +
                                    '${milestoneData!.milestone[myIndex!].startDate!.month.toString()}-' +
                                    '${milestoneData!.milestone[myIndex!].startDate!.year.toString()}',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.grey[600],
                                    fontSize: 11)),
                          ],
                        ),
                      ),
                      //-----------------------------------------//
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: 'End Date: ',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.grey[500],
                                    fontSize: 11)),
                            TextSpan(
                                text: '${milestoneData!.milestone[myIndex!].endDate!.day.toString()}-' +
                                    '${milestoneData!.milestone[myIndex!].endDate!.month.toString()}-' +
                                    '${milestoneData!.milestone[myIndex!].endDate!.year.toString()}',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.grey[500],
                                    fontSize: 11)),
                          ],
                        ),
                      ),
                    ]),
              ),
              //=========================================//
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Divider(color: Colors.grey[400]),
              ),
              //==||||||||||||||||||||||||||||||||||||||==//
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(children: [
                  Icon(Icons.description_outlined, color: Colors.grey[600]),
                  SizedBox(width: 5),
                  Text('Description: ',
                      style: TextStyle(color: Colors.grey[600]))
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                    milestoneData!.milestone[myIndex!].milDes.toString(),
                    style: TextStyle(color: Colors.grey[500])),
              ),
              //=====================================================//
              if (milestoneData!.milestone[myIndex!].imageList!.isNotEmpty)
                Column(
                  children: [
                    Row(children: [
                      Transform.rotate(
                          angle: -math.pi / 2 + 15,
                          // angle: 60 * math.pi / 60,
                          child: Icon(Icons.attach_file, color: Colors.grey)),
                      SizedBox(width: 10),
                      Text('Attachments', style: TextStyle(fontSize: 15)),
                      SizedBox(width: 10),
                      Container(
                        height: 25,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.black,
                        ),
                        child: Center(
                            child: Text(
                                milestoneData!
                                    .milestone[myIndex!].imageList!.length
                                    .toString(),
                                style: TextStyle(color: Colors.white))),
                      ),
                    ]),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: milestoneData!
                              .milestone[myIndex!].imageList!.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 50,
                              width: 70,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Image(
                                  image: FileImage(File(milestoneData!
                                      .milestone[myIndex!].imageList![index])),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }),
                    ),
                    //-------------------------------------------------//
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Divider(color: Colors.grey[400]),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  about() {
    return Container();
  }
}
