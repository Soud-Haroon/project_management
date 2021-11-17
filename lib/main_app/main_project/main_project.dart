// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_management/main_app/appbar/appbar.dart';
import 'package:project_management/main_app/create_project/main_create.dart';
import 'package:project_management/main_app/main_project/utility/project_details.dart';

import 'Models/projectb_data.dart';
import 'utility/main_projectb_card.dart';

class MainProjectPage extends StatefulWidget {
  const MainProjectPage({Key? key}) : super(key: key);
  static ValueNotifier<int> counter = ValueNotifier<int>(projectData.length);

  @override
  _MainProjectPageState createState() => _MainProjectPageState();
}

class _MainProjectPageState extends State<MainProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: buildMyAppBar(context, 'Projects', true, true),
      body: ValueListenableBuilder(
        builder: (BuildContext context, int value, Widget? child) {
          return projectData.length.toString() != '0'
              ? ListView.builder(
                  itemCount: projectData.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MainProjectDetails(
                                  myProjectData: projectData[index])));
                        },
                        child: MainProjectBCard(projectDM: projectData[index]));
                  })
              : Center(child: Text('Click + to Create Project'));
        },
        valueListenable: MainProjectPage.counter,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MainCreateProject()));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
