// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_management/main_app/appbar/appbar.dart';
import 'package:project_management/main_app/create_project/create_projectform.dart';
import 'package:project_management/main_app/main_project/utility/project_tab_details.dart';
import 'package:project_management/utility/const_colors.dart';

import 'Models/project_data.dart';

class MainProjectPage extends StatefulWidget {
  const MainProjectPage({Key? key}) : super(key: key);
  static ValueNotifier<int> counter = ValueNotifier<int>(projectData.length);

  @override
  _MainProjectPageState createState() => _MainProjectPageState();
}

class _MainProjectPageState extends State<MainProjectPage> {
  @override
  Widget build(BuildContext context) {
    bool selected = false;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: buildMyAppBar(context, 'Projects', true, false),
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
                        child: projectCard(context: context,projectDM: projectData[index],selected: selected,counter: MainProjectPage.counter));
                  })
              : Center(child: Text('Click + to Create Project'));
        },
        valueListenable: MainProjectPage.counter,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MyCreateProjectForm()));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
  //-------------------------------------------------------//
  Widget projectCard({required BuildContext context,ProjectDetailModel? projectDM,bool? selected,ValueNotifier<int>? counter}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    height: 155,
    padding: EdgeInsets.symmetric(vertical: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            decoration: BoxDecoration(
              color: selected == false ? Color(0xffFF66B8) : Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 100,
            width: 7,
          ),
          SizedBox(width: 20),
          //========================================//
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (projectDM!.projectName!.isNotEmpty)
                        Text(
                          projectDM.projectName!,
                          style: TextStyle(
                            //color red
                            fontWeight: FontWeight.bold,
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
                  // SizedBox(height: 20.0),
                  if (projectDM.description!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Text(
                        projectDM.description!,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 11,
                          letterSpacing: 1.4,
                        ),
                      ),
                    ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 2, bottom: 4, right: 25),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Start Date: ',
                                    style:
                                        TextStyle(color: Color(0xffA880E3))),
                                TextSpan(
                                    text:
                                        '${projectDM.startDate!.day}-'
                                        '${projectDM.startDate!.month}-'
                                        '${projectDM.startDate!.year}'),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'End Date: ',
                                    style:
                                        TextStyle(color: Color(0xffFBBC00))),
                                TextSpan(
                                    text: '${projectDM.endDate!.day}-'
                                        '${projectDM.endDate!.month}-'
                                        '${projectDM.endDate!.year}'),
                              ],
                            ),
                          ),
                        ]),
                  ),
                  // SizedBox(height: 30),
                  ValueListenableBuilder(
                    builder:
                        (BuildContext context, int value, Widget? child) {
                      return RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: projectDM.milestone.length <= 9
                                    ? 'Milstones:  0${projectDM.milestone.length} '
                                    : 'Milstones:  ${projectDM.milestone.length} ',
                                style: TextStyle(color: Color(0xffFF66B8))),
                            // TextSpan(text: widget.milestones.toString()),
                          ],
                        ),
                      );
                    },
                    valueListenable: counter!,
                  ),
                ]),
          ),
        ]),
      ],
    ),
  );
}
//-----------------------------------------------------------------------//
}
