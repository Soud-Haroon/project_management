// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_management/main_app/appbar/appbar.dart';

import '../../utility/const_colors.dart';
import 'create_status.dart/main_create_status.dart';
import 'model/list_of_status.dart';

class MainStatus extends StatefulWidget {
  const MainStatus({Key? key}) : super(key: key);

  @override
  State<MainStatus> createState() => _MainStatusState();
}

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
              return statusCard(
                  context: context, myStatusModel: statusData[index]);
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

  //-----------------------------------------------------//
  Widget statusCard(
      {required BuildContext context, StatusModel? myStatusModel}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        height: 80,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: myStatusModel!.color == 'Green'
                    ? Colors.green
                    : myStatusModel.color == 'Red'
                        ? Colors.red
                        : myStatusModel.color == 'Yellow'
                            ? Colors.yellow
                            : Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 120,
              width: 5,
            ),
            Text(
              myStatusModel.title!,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                  height: 27,
                  width: myStatusModel.status == true ? 62 : 68,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: myStatusModel.color == 'Green'
                        ? Colors.green
                        : myStatusModel.color == 'Red'
                            ? Colors.red
                            : myStatusModel.color == 'Yellow'
                                ? Colors.yellow
                                : Colors.blue,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(myStatusModel.status.toString(),
                        style: TextStyle(fontSize: 11, color: Colors.black)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
