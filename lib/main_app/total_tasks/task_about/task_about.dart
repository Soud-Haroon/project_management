// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_management/main_app/create_task/task_form.dart';
import 'package:project_management/main_app/main_project/Models/project_data.dart';
import 'dart:ui';
import 'dart:math' as math;
import '../../../utility/const_colors.dart';

class MainTaskAbout extends StatelessWidget {
  MainTaskAbout({Key? key, this.projectDetailModel, this.myIndex}) : super(key: key);
  ProjectDetailModel? projectDetailModel;
  int? myIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyCreateTaskForm(projectModel: projectDetailModel,index: myIndex,edit: true)));
              },
              icon: Icon(Icons.edit_outlined, color: Colors.white))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                child: Image.asset(
                  projectDetailModel!.milestone[myIndex!].taskList[myIndex!].backGroundImage,
                  height: 230,
                  fit: BoxFit.cover,
                )),
            //---------------------------------------------------------//
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(projectDetailModel!.milestone[myIndex!].taskList[myIndex!].taskTitle.toString(),
                        style:
                            TextStyle(fontSize: 22, color: Color(0xff464646))),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(Icons.access_time, color: Colors.grey),
                          SizedBox(width: 10),
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
                          text: '${projectDetailModel!.milestone[myIndex!].taskList[myIndex!].startDate!.day.toString()}-'
                          '${projectDetailModel!.milestone[myIndex!].taskList[myIndex!].startDate!.month.toString()}-'
                          '${projectDetailModel!.milestone[myIndex!].taskList[myIndex!].startDate!.year.toString()}',
                          style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.grey[600],
                          fontSize: 11)),
                          ],
                          ),
                          ),
                        ],
                        ),
                        Row(children: [
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'End Date: ',
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.grey[600],
                                        fontSize: 11)),
                                TextSpan(
                                    text: '${projectDetailModel!.milestone[myIndex!].taskList[myIndex!].endDate!.day.toString()}-'
                                        '${projectDetailModel!.milestone[myIndex!].taskList[myIndex!].endDate!.month.toString()}-'
                                        '${projectDetailModel!.milestone[myIndex!].taskList[myIndex!].endDate!.year.toString()}',
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.grey[600],
                                        fontSize: 11)),
                              ],
                            ),
                          ),
                        ]),
                      ]),
                  SizedBox(height: 5),
                  Divider(color: Colors.grey.withOpacity(0.5), thickness: 1),
                  SizedBox(height: 5),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(Icons.flash_on_outlined, color: Colors.grey),
                          SizedBox(width: 10),
                          Text('Status', style: TextStyle(fontSize: 13)),
                        ]),
                        Container(
                            height: 27,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: projectDetailModel!.milestone[myIndex!].statusValue
                                  .toString() ==
                                  'Status.inprogress'
                                  ? kInProgressColor
                                  : projectDetailModel!.milestone[myIndex!].statusValue
                                  .toString() ==
                                  'Status.onHold'
                                  ? Colors.orange[300]
                                  : projectDetailModel!
                                  .milestone[myIndex!].statusValue
                                  .toString() ==
                                  'Status.done'
                                  ? Colors.green[200]
                                  : null,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(projectDetailModel!.milestone[myIndex!].statusValue
                                  .toString() ==
                                  'Status.inprogress'
                                  ? 'IN PROGRESS'
                                  : projectDetailModel!
                                  .milestone[myIndex!].statusValue
                                  .toString() ==
                                  'Status.onHold'
                                  ? 'ON HOLD'
                                  : projectDetailModel!.milestone[myIndex!]
                                  .statusValue
                                  .toString() ==
                                  'Status.done'
                                  ? 'DONE'
                                  : 'null',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.white)),
                            )),
                      ]),
                  SizedBox(height: 5),
                  Divider(color: Colors.grey.withOpacity(0.5), thickness: 1),
                  SizedBox(height: 5),
                  Row(children: [
                    Icon(
                      Icons.description_outlined,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 10),
                    Text('Description', style: TextStyle(fontSize: 13)),
                  ]),
                  SizedBox(height: 10),
                  Text(projectDetailModel!.milestone[myIndex!].taskList[myIndex!].taskDescription.toString(), style: TextStyle(fontSize: 13)),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey.withOpacity(0.5), thickness: 1),
                  SizedBox(height: 5),
                  Row(children: [
                    Transform.rotate(
                        angle: -math.pi / 2 + 15,
                        // angle: 60 * math.pi / 60,
                        child: Icon(Icons.attach_file)),
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
                          child:
                              Text(projectDetailModel!.milestone[myIndex!].taskList[myIndex!].taskImageList!.length.toString(), style: TextStyle(color: Colors.white))),
                    ),
                  ]),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: projectDetailModel!
                            .milestone[myIndex!].taskList[myIndex!].taskImageList!.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 50,
                            width: 70,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Image(
                                image: FileImage(File(projectDetailModel!
                                    .milestone[myIndex!].taskList[myIndex!].taskImageList![index])),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

String _content =
    'Hello guys, we have discussed about post-corona vacation plan and our decision is to go to Bali. Hello guys, we have discussed about post-corona vacation plan and our decision is to go to Bali. Hello guys, we have discussed about post-corona vacation plan and our decision is to go to Bali. Hello guys, we have discussed about post-corona vacation plan and our decision is to go to Bali. ';
