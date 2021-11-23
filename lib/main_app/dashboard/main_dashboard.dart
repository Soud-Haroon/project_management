// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_management/main_app/appbar/appbar.dart';
import 'model/activite_card_data_list.dart';
import 'utility/dashproject_card.dart';

class MainDashBoard extends StatefulWidget {
  const MainDashBoard({Key? key}) : super(key: key);

  @override
  State<MainDashBoard> createState() => _MainDashBoardState();
}

class _MainDashBoardState extends State<MainDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: buildMyAppBar(context, 'DashBoard', false, false),
      body: Stack(
        children: [
          //================================================//
          Container(
            height: MediaQuery.of(context).size.height * 0.50,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/myback3.png'),
                colorFilter: ColorFilter.mode(
                    Color(0xfff6f3ea).withOpacity(0.4), BlendMode.dstATop),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //==================================================//
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Take a look at what has been done so far',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff3C3C3C))),
                ),
                //======================================================//
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Project',
                      style: Theme.of(context).textTheme.headline6),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Expaned All', style: TextStyle(fontSize: 12)),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MainDashBoardCard(
                    header: _header,
                    bodyContent: _bodyContent,
                    startDate: _startDate,
                    endDate: _endDate,
                    milestones: _milestones,
                  ),
                ),
                //=========================================================//
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Activities',
                      style: Theme.of(context).textTheme.headline6),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Expaned All', style: TextStyle(fontSize: 12)),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                    height: 183,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dashActCardData.length,
                        itemBuilder: (context, index) =>
                            dashActCardData[index]),
                  ),
                ),
                // MainDashActivitesCard(number: 17, Needactivite: 'Completed',),
                // Spacer(),
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //       createDialogs(context);
      //     },
      //     child: Icon(
      //       Icons.add,
      //       color: Colors.white,
      //     )),
    );
  }

  Future<Object?> createDialogs(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierColor: Colors.black54,
      barrierDismissible: true,
      barrierLabel: 'Label',
      pageBuilder: (_, __, ___) {
        return Padding(
          padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.04,
              bottom: MediaQuery.of(context).size.height * 0.1),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 160,
              width: 168,
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffA880E3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 26,
                        width: 4,
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pop(context);
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const MainCreateProject()));
                        },
                        child: Text('Create Project',
                            style: TextStyle(
                                fontSize: 13,
                                decoration: TextDecoration.none,
                                color: Color(0xff7B7A7A))),
                      )
                    ]),
                    Row(children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffFBBC00),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 26,
                        width: 4,
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pop(context);
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) =>
                          //         MyCreateMileForm()));
                        },
                        child: Text('Create Milestones',
                            style: TextStyle(
                                fontSize: 13,
                                decoration: TextDecoration.none,
                                color: Color(0xff7B7A7A))),
                      ),
                    ]),
                    Row(children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffFF66B8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 26,
                        width: 4,
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pop(context);
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) =>
                          //         const MainCreateActivity()));
                        },
                        child: Text('Create Activity',
                            style: TextStyle(
                                fontSize: 13,
                                decoration: TextDecoration.none,
                                color: Color(0xff7B7A7A))),
                      ),
                    ]),
                  ]),
            ),
          ),
        );
      },
    );
  }



  
}

String _header = 'Tower';
String _bodyContent =
    'Hello guys, we have discussed about post-corona vacation plan and our decision is to go to Bali.';
String _startDate = '10-12-2021';
String _endDate = '10-12-2021';
int _milestones = 15;
