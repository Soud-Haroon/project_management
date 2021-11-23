// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project_management/main_app/main_Instalment/main_Instalments.dart';
import 'package:project_management/main_app/main_project/Models/projectb_data.dart';
import 'package:project_management/main_app/milestones/main_milestones.dart';

import '../../../utility/const_colors.dart';
import 'about_project.dart';

class MainProjectDetails extends StatefulWidget {
  MainProjectDetails({this.myProjectData ,Key? key}) : super(key: key);

  ProjectDetailModel? myProjectData;

  @override
  _MainProjectDetailsState createState() => _MainProjectDetailsState();
}

class _MainProjectDetailsState extends State<MainProjectDetails> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xffFAF7F2),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: MediaQuery.of(context).platformBrightness == Brightness.light
                ? kContentColorLightTheme
                : Colors.grey,
            onPressed: () { Navigator.of(context).pop();},
          ),
          title: Text(
            widget.myProjectData!.projectName.toString(),
            style: TextStyle(
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? kContentColorLightTheme
                    : Colors.grey),
          ),
          bottom: TabBar(
            labelColor: kPrimaryOrange,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(text: 'About'),
              Tab(text: "Milestone's"),
              Tab(text: 'Finacial'),
            ],
          ),
        ),
        body: TabBarView(children: [
          AboutProject(aboutProjectData: widget.myProjectData!),
          MainMilestones(mileProjectData: widget.myProjectData!),
          MainInstalment(),
        ]),
      ),
    );
  }
}
