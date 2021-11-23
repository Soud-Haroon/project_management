// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:project_management/main_app/appbar/appbar.dart';
import 'package:project_management/main_app/main_profile/utility/edit_profile.dart';
import 'package:project_management/utility/text_field_styling.dart';

class MainProfile extends StatelessWidget {
  const MainProfile({Key? key}) : super(key: key);

  // final keyProfile = GlobalKey<_MainHomeProfileState>();

  @override
  Widget build(BuildContext context) {
    String yourname = 'Usman Ali';
    String fathername = 'Ali Butt';
    String address = 'H 75B, St 5 Miliatary accounts Society';
    String email = 'muhammad.usman@gmail.com';
    String phone = '0301-234567890';

    final TextEditingController _yourNameCon = TextEditingController();

    final TextEditingController _fatherNameCon = TextEditingController();

    final TextEditingController _addressCon = TextEditingController();

    final TextEditingController _emailCon = TextEditingController();

    final TextEditingController _phoneCon = TextEditingController();

    final maskFormatter = MaskTextInputFormatter(mask: '+92 ### ### ####');

    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.transparent,
      appBar: buildMyAppBar(context, 'Profile', false, true),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              profilePicture(context: context),
              //--------------------------------------------------//
              TextFormField(
                enabled: false,
                controller: _yourNameCon,
                textInputAction: TextInputAction.next,
                decoration: buildMyInputDecoration(context, yourname),
              ),
              SizedBox(height: 10),
              TextFormField(
                enabled: false,
                controller: _fatherNameCon,
                textInputAction: TextInputAction.next,
                decoration: buildMyInputDecoration(context, fathername),
              ),
              SizedBox(height: 10),
              TextFormField(
                enabled: false,
                controller: _addressCon,
                textInputAction: TextInputAction.next,
                decoration: buildMyInputDecoration(context, address),
              ),
              SizedBox(height: 10),
              TextFormField(
                enabled: false,
                controller: _emailCon,
                textInputAction: TextInputAction.next,
                decoration: buildMyInputDecoration(context, email),
              ),
              SizedBox(height: 10),
              TextFormField(
                enabled: false,
                controller: _phoneCon,
                inputFormatters: [maskFormatter],
                textInputAction: TextInputAction.next,
                decoration: buildMyInputDecoration(context, phone),
              ),
              SizedBox(height: 10),
              portFolioCard(
                context: context,
                headTitle: 'Portfolio',
                press: () {},
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  //=====================TopProfileSelection=======================//
  Widget profilePicture({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(children: [
        SizedBox(width: 10),
        CircleAvatar(
          radius: (40),
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(100),
            child: Image.asset("assets/persons/user.png"),
          ),
        ),
        SizedBox(width: 20),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Name Here',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          SizedBox(height: 5),
          Text('Front-End UI', style: TextStyle(color: Colors.grey)),
          SizedBox(height: 5),
          TextButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainEditProfileForm()));
              },
              icon: Icon(Icons.edit_outlined),
              label: Text('Edit')),
        ]),
      ]),
    );
  }

  //======================PortFolioSelection=======================//
  Widget portFolioCard(
      {required BuildContext context, String? headTitle, VoidCallback? press}) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 64,
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
                Text('$headTitle',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontFamily: GoogleFonts.sofia().toString()))
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
    );
  }
}
