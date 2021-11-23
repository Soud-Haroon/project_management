// ignore_for_file: prefer_const_constructors

import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:project_management/main_app/dashboard/main_dashboard.dart';
import 'package:project_management/main_app/main_project/main_project.dart';
import 'package:project_management/main_app/main_setting/main_setting.dart';

import '../../utility/const_colors.dart';

class MainNavBar extends StatefulWidget {
  const MainNavBar({ Key? key }) : super(key: key);


  @override
  State<MainNavBar> createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> {
  int _currentIndex = 0;
    Map<int, Widget> map = {
    0: MainDashBoard(),
    1: MainProjectPage(),
    2: MainSetting(),
    // 4: MainProfile(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF7F2),
        body: Container(
          child: map[_currentIndex],
        ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              boxShadow: const [BoxShadow(color: Color(0xfff6f3ea), spreadRadius: 5, blurRadius: 3)],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              ),  
        child: BottomBar(
          backgroundColor: Colors.white,
        selectedIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
        items: <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: kPrimaryOrange,
            inactiveColor: Color(0xffDADADA),
          ),
          BottomBarItem(
            icon: Icon(Icons.layers),
            title: Text('Likes'),
            activeColor: kPrimaryOrange,
            inactiveColor: Color(0xffDADADA), // Optional
          ),
          BottomBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: kPrimaryOrange,
            inactiveColor: Color(0xffDADADA),
          ),
        ],
      ),
            )),
    );
  }
}