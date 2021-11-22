// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:project_management/main_app/appbar/appbar.dart';
import 'package:project_management/main_app/create_task/task_mil.dart';
import 'package:project_management/main_app/main_project/Models/projectb_data.dart';
import 'package:project_management/main_app/total_tasks/task_about/task_about.dart';

import 'utility/task_card.dart';

class MainTotalTasks extends StatefulWidget {
  MainTotalTasks({this.projectDetailModel,this.index ,Key? key}) : super(key: key);
  ProjectDetailModel? projectDetailModel;
  int? index;
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
        return widget.projectDetailModel!.milestone[widget.index!].taskList.isNotEmpty ?
        ListView.builder(
            itemCount: widget.projectDetailModel!.milestone[widget.index!].taskList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainTaskAbout()));
                },
                child: TotalTaskCard(
                  projectDetailModel: widget.projectDetailModel, index: widget.index,builderIndex: index,
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
                builder: (context) => MainCreateTask(
                    projectDetailModel: widget.projectDetailModel, index: widget.index)));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
