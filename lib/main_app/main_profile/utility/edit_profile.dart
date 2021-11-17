// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_constructors_in_immutables, unnecessary_new

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_management/main_app/appbar/appbar.dart';
import 'package:project_management/shareprefernce/main_share.dart';

import '../../../const_colors.dart';
import 'main_portfolio.dart';
import 'services_chip.dart';

String yourname = 'Your Name';
String fathername = 'Father';
String address = 'Address';
String email = 'Email';
String phone = 'Phone';

class MainEditProfileForm extends StatefulWidget {
  const MainEditProfileForm({Key? key}) : super(key: key);

  @override
  State<MainEditProfileForm> createState() => _MainEditProfileFormState();
}

class _MainEditProfileFormState extends State<MainEditProfileForm> {
  var dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildMyAppBar(context, 'Edit Profile', false, true),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            ProfilePic(),
            //--------------------------------------------------//
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: buildMyInputDecoration(context, yourname),
            ),
            SizedBox(height: 10),
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: buildMyInputDecoration(context, fathername),
            ),
            SizedBox(height: 10),
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: buildMyInputDecoration(context, address),
            ),
            SizedBox(height: 10),
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: buildMyInputDecoration(context, email),
            ),
            SizedBox(height: 10),
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: buildMyInputDecoration(context, phone),
            ),
            const SizedBox(height: 10),
            //------------------------------------------------//
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent, width: 0),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    elevation: 0,
                    isExpanded: true,
                    hint:
                        const Text('Services', style: TextStyle(fontSize: 12)),
                    onChanged: (String? newValue) {
                      setState(() {
                        if (Chips.chipList.length <= 6) {
                          Chips.chipList.add(newValue.toString());
                        }
                        // dropdownValue = newValue;
                      });
                    },
                    items: <String>['Construction', 'Painting', 'Floor Coating']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Chips.chipList.isNotEmpty ? Chips() : null,
            ),
            // const SizedBox(height: 20),
            //-------------------------------------------------------//
            SizedBox(height: 10),
            PortfolioCard(
              headTitle: 'Portfolio',
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainPortfolio()));
              },
            ),
            SizedBox(height: 15),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        child: const Text('SAVE',
                            style:
                                TextStyle(color: Colors.white)), //next button
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          // primary: Color(0xffC53B4B),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const MainDependent()));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
          ]),
        ),
      ),
    );
  }
}
//=====================================================================//

InputDecoration buildMyInputDecoration(BuildContext context, String hint) {
  return InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: Colors.transparent, width: 0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: Colors.transparent, width: 0),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.transparent, width: 0),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    filled: true,
    fillColor: Colors.white,
    labelText: hint,
    labelStyle: const TextStyle(fontSize: 12),
    // enabled: false,
    // hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
  );
}

//--------------------------------------------------------------//

class ProfilePic extends StatefulWidget {
  ProfilePic({Key? key}) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  XFile? changeImage;
  String? imagePath;
  String? fileName;
  Future pickImage() async {
    try {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;

      setState(() {
        imagePath = image.path;
        // this.image = imageTemp;
        // saveImage(this.image);
      });
      File file = new File(imagePath!);
      fileName = file.path.split('/').last;
      saveImage('SaveImage',image.path);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Access Rejected: $e');
    }
  }
  @override
  void initState() {
    super.initState();
    loadImage('SaveImage').then((value) {
      setState(() {
        imagePath = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(children: [
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            pickImage();
          },
          child: Stack(
            children: [
              CircleAvatar(
                radius: (50),
                backgroundColor: Colors.transparent,
                child: 
                imagePath != null ?
                CircleAvatar(
                          radius: 50,
                          child: ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(100),
                            child: Image(
                              image: FileImage(File(imagePath!)),
                              height: 114,
                              width: 115,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                :ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset("assets/persons/user.png"),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 15,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                        height: 20,
                        width: 20,
                        color: kPrimaryOrange,
                        child: Icon(
                          Icons.edit_outlined,
                          size: 12,
                          color: Colors.white,
                        ))),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

//-----------------------------------------------------------------
class PortfolioCard extends StatelessWidget {
  //reused card
  String? headTitle;
  final VoidCallback? press;

  PortfolioCard({
    Key? key,
    this.headTitle,
    this.press,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
