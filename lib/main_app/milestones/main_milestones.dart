// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:project_management/main_app/create_milestone/mian_createmile.dart';
import 'package:project_management/main_app/main_Instalment/main_Instalments.dart';
import 'package:project_management/main_app/main_project/Models/projectb_data.dart';
import 'package:project_management/main_app/main_project/utility/milestone_project.dart';
import 'package:project_management/main_app/total_tasks/main_task.dart';
import 'utility/main_mil_card.dart';

class MainMilestones extends StatefulWidget {
  MainMilestones({required this.mileProjectData, Key? key}) : super(key: key);
  static ValueNotifier<int> counter = ValueNotifier<int>(projectData.length);

  ProjectDetailModel mileProjectData;
  @override
  _MainMilestonesState createState() => _MainMilestonesState();
}

class _MainMilestonesState extends State<MainMilestones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ValueListenableBuilder(
        builder: (BuildContext context, int value, Widget? child) {
        return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: widget.mileProjectData.milestone.isNotEmpty
            ? ListView.builder(
                itemCount: widget.mileProjectData.milestone.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // _myShowBottomSheet(context);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Milestone_of_Project(
                              milestoneData: widget.mileProjectData,
                              index: index)));
                    },
                    child: MilestonesCard(
                      mileDataModel: widget.mileProjectData.milestone[index],
                    ),
                  );
                })
            : Center(
                child: Text('Click + to Create Milestone!')
              ));
      },
    valueListenable: MainMilestones.counter,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    MainCreateMilestones(model: widget.mileProjectData)));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }

  Future<dynamic> _myShowBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        enableDrag: false,
        isDismissible: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        backgroundColor: Color(0xffFAF7F2),
        context: context,
        builder: (context) {
          return Container(
            height: 700,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(' '),
                        Text('Activity', style: TextStyle(fontSize: 16)),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close,
                              size: 25,
                            ))
                      ]),
                ),
                //-----------------------------------------//
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 5),
                  child: Material(
                    elevation: 2,
                    shadowColor: Colors.grey.withOpacity(0.2),
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      height: 290,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      //===================================//
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 20, right: 30),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MainInstalment()));
                                  },
                                  child: _FinancialContainer()),
                            ),
                            ///////////////////here//////////////////////
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, bottom: 40, right: 30),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MainTotalTasks()));
                                  },
                                  child: _TaskContainer()),
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

//----------------------------------------------------//
class _TaskContainer extends StatelessWidget {
  const _TaskContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      child: Column(children: [
        //---------------------------------//
        Row(children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xffFBBC00),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 32,
            width: 4,
          ),
          SizedBox(width: 10),
          Text(
            'Task',
            style: TextStyle(fontSize: 16),
          )
        ]),
        //---------------------------------//
        SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(
                    text: 'Total Task: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' 15 tasks'),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(
                    text: 'Open / Active:   ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' 5 tasks'),
              ],
            ),
          ),
        ]),
        SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(
                    text: 'Closed:  ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' 2 tasks'),
              ],
            ),
          ),
          Text(' '),
        ]),
      ]),
    );
  }
}

//======================================================//
class _FinancialContainer extends StatelessWidget {
  const _FinancialContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      child: Column(children: [
        //---------------------------------//
        Row(children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xff03DF76),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 32,
            width: 4,
          ),
          SizedBox(width: 10),
          Text(
            'Financial',
            style: TextStyle(fontSize: 16),
          )
        ]),
        //---------------------------------//
        SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(
                    text: 'Sale Price: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' 100%'),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(
                    text: 'Down Payment: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' 20%'),
              ],
            ),
          ),
        ]),
        SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(
                    text: 'Installment: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' 100%'),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(
                    text: 'Posession: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' 20%'),
              ],
            ),
          ),
        ]),
      ]),
    );
  }
}
