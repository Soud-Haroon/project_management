// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:project_management/main_app/status/model/list_of_status.dart';

class MainStatusCard extends StatelessWidget {

  StatusModel myStatusModel = StatusModel();

  MainStatusCard({
    Key? key,
    required this.myStatusModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                color: checkColor(),
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
                    color: checkColor().withOpacity(0.4),
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

  MaterialColor checkColor() => myStatusModel.color == 'Green' ? Colors.green : myStatusModel.color == 'Red' ? Colors.red : myStatusModel.color == 'Yellow' ? Colors.yellow : Colors.blue;
}
