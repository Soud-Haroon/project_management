// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:project_management/main_app/appbar/appbar.dart';
// import 'package:project_management/main_app/main_project/Models/projectb_data.dart';

// import 'utility/create_mileform.dart';

// class MainCreateMilestones extends StatelessWidget {
//   MainCreateMilestones({this.model, this.myIndex,this.edit, Key? key}) : super(key: key);

//   ProjectDetailModel? model;
//   int? myIndex;
//   bool? edit;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: buildMyAppBar(context, edit == true ? 'Update Milestones': 'Create Milestones', false, true),
//       backgroundColor: Color(0xffE5E5E5),
//       body: MyCreateMileForm(projectModel: model, myIndex: myIndex, edit: edit,),
//     );
//   }
// }