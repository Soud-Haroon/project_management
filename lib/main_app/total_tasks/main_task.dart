// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:project_management/main_app/appbar/appbar.dart';
import 'package:project_management/main_app/create_task/task_form.dart';
import 'package:project_management/main_app/main_project/Models/project_data.dart';
import 'package:project_management/main_app/total_tasks/task_about/task_about.dart';
import 'package:project_management/utility/const_colors.dart';


class MainTotalTasks extends StatefulWidget {
  MainTotalTasks({this.projectDetailModel,this.myIndex ,Key? key}) : super(key: key);
  ProjectDetailModel? projectDetailModel;
  int? myIndex;
  static ValueNotifier<int> counter = ValueNotifier<int>(projectData.length);
  @override
  _MainTotalTasksState createState() => _MainTotalTasksState();
}

class _MainTotalTasksState extends State<MainTotalTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAF7F2),
      appBar: buildMyAppBar(context, 'Total Tasks', true, true),
      body: ValueListenableBuilder(
        builder: (BuildContext context, int value, Widget? child) {
        return widget.projectDetailModel!.milestone[widget.myIndex!].taskList.isNotEmpty ?
        ListView.builder(
            itemCount: widget.projectDetailModel!.milestone[widget.myIndex!].taskList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainTaskAbout(projectDetailModel: widget.projectDetailModel,myIndex: widget.myIndex)));
                },
                child: taskCard(
                  context: context,
                  projectDetailModel: widget.projectDetailModel, index: widget.myIndex,builderIndex: index,
                ),
              );
            }) :
            Center(
                child: Text('Click + to Create Task!')
              );
        }, valueListenable: MainTotalTasks.counter,
      ),
      //=======================================//
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MyCreateTaskForm(
                    projectModel: widget.projectDetailModel, index: widget.myIndex)));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
  //====================task=card=========================//
  Widget taskCard({required BuildContext context,ProjectDetailModel? projectDetailModel,
    int? index,
    int? builderIndex,}) {
    var _taskVariable = projectDetailModel!.milestone[index!].taskList[index];
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
                              color: widget.projectDetailModel!.milestone[widget.myIndex!].taskList[widget.myIndex!].taskStatusValue
                                  .toString() ==
                                  'Status.inprogress'
                                  ? kInProgressColor
                                  : widget.projectDetailModel!.milestone[widget.myIndex!].taskList[widget.myIndex!].taskStatusValue
                                  .toString() ==
                                  'Status.onHold'
                                  ? Colors.orange[300]
                                  : widget.projectDetailModel!.milestone[widget.myIndex!].taskList[widget.myIndex!].taskStatusValue
                                  .toString() ==
                                  'Status.done'
                                  ? Colors.green[200]
                                  : null,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(widget.projectDetailModel!.milestone[widget.myIndex!].taskList[widget.myIndex!].taskStatusValue
                                  .toString() ==
                                  'Status.inprogress'
                                  ? 'IN PROGRESS'
                                  : widget.projectDetailModel!.milestone[widget.myIndex!].taskList[widget.myIndex!].taskStatusValue
                                  .toString() ==
                                  'Status.onHold'
                                  ? 'ON HOLD'
                                  : widget.projectDetailModel!.milestone[widget.myIndex!].taskList[widget.myIndex!].taskStatusValue
                                  .toString() ==
                                  'Status.done'
                                  ? 'DONE'
                                  : 'null',
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
