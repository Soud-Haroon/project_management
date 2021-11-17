// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingCard extends StatelessWidget {
  //reused card
  String? headTitle;
  String? imagePath;
  final VoidCallback? press;

  SettingCard({
    Key? key,
    this.headTitle,
    this.press,
    required this.imagePath,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                  Text('$headTitle',
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
