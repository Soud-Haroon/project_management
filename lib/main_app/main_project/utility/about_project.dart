// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project_management/main_app/main_project/Models/projectb_data.dart';

class AboutProject extends StatelessWidget {
  AboutProject({required this.aboutProjectData,Key? key}) : super(key: key);

  ProjectDetailModel aboutProjectData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(aboutProjectData.projectName!,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Color(0xff3C3C3C))),
              //===================================//
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Owner Name:',
                          style: TextStyle(color: Colors.grey[600])),
                      Text(aboutProjectData.ownerName!, style: TextStyle(color: Colors.grey[500])),
                    ]),
              ),
              //=========================================//
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Divider(color: Colors.grey[400]),
              ),
              //=========================================//
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Company Name:',
                          style: TextStyle(color: Colors.grey[600])),
                      Text(aboutProjectData.companyName!, style: TextStyle(color: Colors.grey[500])),
                    ]),
              ),
              //=========================================//
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Divider(color: Colors.grey[400]),
              ),
              //=========================================//
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Type:', style: TextStyle(color: Colors.grey[600])),
                      Text(aboutProjectData.type!, style: TextStyle(color: Colors.grey[500])),
                    ]),
              ),
              //=========================================//
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Divider(color: Colors.grey[400]),
              ),
              //=========================================//
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Area:', style: TextStyle(color: Colors.grey[600])),
                      Text(aboutProjectData.area!, style: TextStyle(color: Colors.grey[500])),
                    ]),
              ),
              //=========================================//
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Divider(color: Colors.grey[400]),
              ),
              //=========================================//
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Start Date: ',
                                style: TextStyle(color: Colors.grey[600])),
                            TextSpan(
                                text: '${aboutProjectData.startDate!.day}-' + '${aboutProjectData.startDate!.month}-'+'${aboutProjectData.startDate!.year}',
                                style: TextStyle(color: Colors.grey[600])),
                          ],
                        ),
                      ),
                      //-----------------------------------------//
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: 'End Date: ',
                                style: TextStyle(color: Colors.grey[500])),
                            TextSpan(
                                text: '${aboutProjectData.endDate!.day}-' + '${aboutProjectData.endDate!.month}-'+'${aboutProjectData.endDate!.year}',
                                style: TextStyle(color: Colors.grey[500])),
                          ],
                        ),
                      ),
                    ]),
              ),
              //=========================================//
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Divider(color: Colors.grey[400]),
              ),
              //=========================================//
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sale Price:',
                          style: TextStyle(color: Colors.grey[600])),
                      Text(aboutProjectData.salePrice!, style: TextStyle(color: Colors.grey[500])),
                    ]),
              ),
              //=========================================//
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Divider(color: Colors.grey[400]),
              ),
              //==||||||||||||||||||||||||||||||||||||||==//
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(children: [
                  Icon(Icons.description_outlined, color: Colors.grey[600]),
                  SizedBox(width: 5),
                  Text('Description: ', style: TextStyle(color: Colors.grey[600]))
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(aboutProjectData.description!,
                    style: TextStyle(color: Colors.grey[500])),
              ),
            ],
          ),
        ),
      ),
    );
  }

  about() {
    return Container();
  }
}
