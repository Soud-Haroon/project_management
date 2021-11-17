// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:project_management/main_app/appbar/appbar.dart';
import 'package:project_management/main_app/main_profile/main_profile.dart';
import 'package:project_management/main_app/status/main_status.dart';
import 'package:project_management/main_app/user/main_user.dart';

import 'utility/setting_card.dart';

class MainSetting extends StatelessWidget {
  const MainSetting({Key? key}) : super(key: key);

  // final keyProfile = GlobalKey<_MainHomeProfileState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: buildMyAppBar(context, 'Setting', false, true),
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SettingCard(
                headTitle: 'Profile',
                imagePath: image1,
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainProfile()));
                }),
            SettingCard(
                headTitle: 'Manage User',
                imagePath: image2,
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainUser()));
                }),
            SettingCard(
                headTitle: 'Manage Status',
                imagePath: image3,
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainStatus()));
                }),
          ],
        ),
      ),
    );
  }
}

String image1 = 'assets/persons/user.png';
String image2 = 'assets/icons/cus_icon.png';
String image3 = 'assets/icons/projecticon2.png';
