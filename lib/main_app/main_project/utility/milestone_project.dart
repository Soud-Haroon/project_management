// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unnecessary_string_interpolations, camel_case_types

import 'package:flutter/material.dart';
import 'package:project_management/main_app/appbar/appbar.dart';
import 'package:project_management/main_app/main_project/Models/projectb_data.dart';
import 'package:project_management/main_app/total_tasks/main_task.dart';

import '../../../const_colors.dart';

class Milestone_of_Project extends StatelessWidget {
  Milestone_of_Project({this.milestoneData, this.index, Key? key})
      : super(key: key);

  ProjectDetailModel? milestoneData;
  int? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildMyAppBar(
          context,
          '${milestoneData!.milestone[index!].mileName.toString()}',
          false,
          true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //=====================================//
              Text(milestoneData!.milestone[index!].mileName.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: Color(0xff3C3C3C))),
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
                          child: milestoneData!.milestone[index!].taskList.length.toString() == '0' ?Text("Tasks: (0${milestoneData!.milestone[index!].taskList.length})") : milestoneData!.milestone[index!].taskList.length <=9 ? Text("Tasks: (0${milestoneData!.milestone[index!].taskList.length })") : Text("Tasks: (${milestoneData!.milestone[index!].taskList.length })"),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MainTotalTasks(projectDetailModel: milestoneData,index: index)));
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
                    if (milestoneData!.milestone[index!].mileName!.isNotEmpty)
                      Text('Status:'),
                    Container(
                        height: 27,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: kInProgressColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text('IN PROGRESS',
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
                                text: '${milestoneData!.milestone[index!].startDate!.day.toString()}-' +
                                    '${milestoneData!.milestone[index!].startDate!.month.toString()}-' +
                                    '${milestoneData!.milestone[index!].startDate!.year.toString()}',
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
                                text: '${milestoneData!.milestone[index!].endDate!.day.toString()}-' +
                                    '${milestoneData!.milestone[index!].endDate!.month.toString()}-' +
                                    '${milestoneData!.milestone[index!].endDate!.year.toString()}',
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
                child: Text(milestoneData!.milestone[index!].milDes.toString(),
                    style: TextStyle(color: Colors.grey[500])),
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
