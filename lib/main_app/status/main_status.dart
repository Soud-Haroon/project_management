// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_management/main_app/appbar/appbar.dart';

import '../../const_colors.dart';
import 'create_status.dart/main_create_status.dart';
import 'model/list_of_status.dart';
import 'utility/status_card.dart';

class MainStatus extends StatefulWidget {
  const MainStatus({Key? key}) : super(key: key);

  @override
  State<MainStatus> createState() => _MainStatusState();
}
// ListView.builder(
//         itemCount: statusData.length,
//         itemBuilder: (context, index) {
//         return MainStatusCard(myStatusModel: statusData[index]);
//       }),

class _MainStatusState extends State<MainStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffF6F0EA),
      appBar: buildMyAppBar(context, 'Status', false, true),
      body: FutureBuilder(builder: (context, AsyncSnapshot) {
        return ListView.builder(
            itemCount: statusData.length,
            itemBuilder: (context, index) {
              return MainStatusCard(myStatusModel: statusData[index]);
            });
      }),
      //-----------------------------------//
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MainCreateStatus()));
        },
        label: const Text('Add Status', style: TextStyle(fontSize: 11)),
        icon: const Icon(Icons.add, color: kPrimaryOrange, size: 30),
        backgroundColor: const Color(0xffC8DFF5),
      ),
    );
  }
}
