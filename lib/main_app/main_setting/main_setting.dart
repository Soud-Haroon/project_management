// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_management/main_app/appbar/appbar.dart';
import 'package:project_management/main_app/main_profile/main_profile.dart';
import 'package:project_management/main_app/status/main_status.dart';
import 'package:project_management/main_app/user/main_user.dart';

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
            settingCard(
                context: context,
                headtitle: 'Profile',
                imagePath: image1,
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainProfile()));
                }),
            settingCard(
                context: context,
                headtitle: 'Manage User',
                imagePath: image2,
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainUser()));
                }),
            settingCard(
                context: context,
                headtitle: 'Manage Status',
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

  //-------------------------------------------------//
  Widget settingCard(
      {required BuildContext context,
      VoidCallback? press,
      String? imagePath,
      String? headtitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: press,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            // border: Border.all(color: Colors.grey.withOpacity(0.1), width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            //============================================//
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //=========================================//
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xffEDF5FF),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(imagePath!),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(headtitle!,
                      style:
                          TextStyle(fontFamily: GoogleFonts.sofia().toString()))
                ]),
                //===============================================//
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Color(0xffEDF5FF),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios,
                        size: 15, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String image1 = 'assets/persons/user.png';
String image2 = 'assets/icons/cus_icon.png';
String image3 = 'assets/icons/projecticon2.png';
