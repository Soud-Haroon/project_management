// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_management/main_app/appbar/appbar.dart';
import 'package:project_management/main_app/create_task/utility/task_form.dart';
import 'package:project_management/main_app/main_project/Models/projectb_data.dart';

class MainCreateTask extends StatelessWidget {
  MainCreateTask({this.projectDetailModel,this.index,Key? key}) : super(key: key);

  ProjectDetailModel? projectDetailModel;
  int? index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildMyAppBar(context, 'Create Task', false, true),
      body: MyCreateTaskForm(projectModel: projectDetailModel, index: index),
    );
  }
}
