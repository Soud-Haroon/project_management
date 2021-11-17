// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:project_management/main_app/appbar/appbar.dart';

import '../../../const_colors.dart';
// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

String firstname = 'Your name';
String lastname = 'Last name';
String email = 'email';
String phone = 'phone';

bool myDraftorders = false;
bool myProducts = false;
bool myGiftCards = false;
bool myCustomers = false;
bool myReports = false;
bool myDashboards = false;

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  var _dropdownValue;
  TextEditingController firstnameCon = TextEditingController();
  TextEditingController lastnameCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController phoneCon = TextEditingController();
  final maskFormatter = MaskTextInputFormatter(mask: '+92 ### ### ####');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffF6F0EA),
      appBar: buildMyAppBar(context, 'Create User', false, true),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            ProfilePic(),
            //--------------------------------------------------//
            TextFormField(
              controller: firstnameCon,
              textInputAction: TextInputAction.next,
              decoration: buildMyInputDecoration(context, firstname),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: lastnameCon,
              textInputAction: TextInputAction.next,
              decoration: buildMyInputDecoration(context, lastname),
            ),
            SizedBox(height: 10),
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: buildMyInputDecoration(context, email),
            ),
            SizedBox(height: 10),
            Container(
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.transparent,
                  width: 0,
                ),
              ),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    labelText: "Role",
                    labelStyle: TextStyle(fontSize: 12, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white),
                value: _dropdownValue,
                items: <String>['Destination', 'Software']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _dropdownValue = value;
                  });
                },
              ),
            ),
            //-----------------------------------------------------//
            SizedBox(height: 5),
            TextFormField(
              textInputAction: TextInputAction.next,
              inputFormatters: [maskFormatter],
              decoration: buildMyInputDecoration(context, phone),
            ),
            //-----------------------------------------------------//
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text("Permissions",
                    style: TextStyle(fontSize: 14, color: Color(0xff717171))),
              ),
            ),
            SizedBox(height: 5),
            Row(children: [
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            myDraftorders = !myDraftorders;
                          });
                        },
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.fastLinearToSlowEaseIn,
                              decoration: BoxDecoration(
                                  color: myDraftorders
                                      ? kPrimaryOrange
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: myDraftorders
                                      ? null
                                      : Border.all(
                                          color: kPrimaryOrange,
                                          width: 2.0,
                                        )),
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(width: 20),
                            Text('Draftorders'),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      //---------------------------------//
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            myProducts = !myProducts;
                          });
                        },
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.fastLinearToSlowEaseIn,
                              decoration: BoxDecoration(
                                  color: myProducts
                                      ? kPrimaryOrange
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: myProducts
                                      ? null
                                      : Border.all(
                                          color: kPrimaryOrange,
                                          width: 2.0,
                                        )),
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(width: 20),
                            Text('Products'),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      //---------------------------------//
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            myGiftCards = !myGiftCards;
                          });
                        },
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.fastLinearToSlowEaseIn,
                              decoration: BoxDecoration(
                                  color: myGiftCards
                                      ? kPrimaryOrange
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: myGiftCards
                                      ? null
                                      : Border.all(
                                          color: kPrimaryOrange,
                                          width: 2.0,
                                        )),
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(width: 20),
                            Text('GiftCards'),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      //---------------------------------//
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            myCustomers = !myCustomers;
                          });
                        },
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.fastLinearToSlowEaseIn,
                              decoration: BoxDecoration(
                                  color: myCustomers
                                      ? kPrimaryOrange
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: myCustomers
                                      ? null
                                      : Border.all(
                                          color: kPrimaryOrange,
                                          width: 2.0,
                                        )),
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(width: 20),
                            Text('Customers'),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      //---------------------------------//
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            myReports = !myReports;
                          });
                        },
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.fastLinearToSlowEaseIn,
                              decoration: BoxDecoration(
                                  color: myReports
                                      ? kPrimaryOrange
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: myReports
                                      ? null
                                      : Border.all(
                                          color: kPrimaryOrange,
                                          width: 2.0,
                                        )),
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(width: 20),
                            Text('Reports'),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      //---------------------------------//
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            myDashboards = !myDashboards;
                          });
                        },
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.fastLinearToSlowEaseIn,
                              decoration: BoxDecoration(
                                  color: myDashboards
                                      ? kPrimaryOrange
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: myDashboards
                                      ? null
                                      : Border.all(
                                          color: kPrimaryOrange,
                                          width: 2.0,
                                        )),
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(width: 20),
                            Text('Dashboards'),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                    ]),
              ),
            ]),
            //==============================================//
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('Create',
                          style: TextStyle(color: Colors.white)), //next button
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => NavBar(0)));
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
          ]),
        ),
      ),
    );
  }
}
//=====================================================================//

//---------------------------------------------------------------------//
InputDecoration buildMyInputDecoration(BuildContext context, String hint) {
  return InputDecoration(
    // focusedBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(6),
    //   borderSide: BorderSide(color: Colors.transparent, width: 0),
    // ),
    // enabledBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(6),
    //   borderSide: BorderSide(color: Colors.transparent, width: 0),
    // ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.transparent, width: 0),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    filled: true,
    fillColor: Colors.white,
    labelText: hint,
    labelStyle: const TextStyle(fontSize: 12),
    enabled: false,
    // hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
  );
}

//--------------------------------------------------------------//
class ProfilePic extends StatelessWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          TextButton.icon(
              onPressed: () {
                //         Navigator.push(
                // context,
                // MaterialPageRoute(
                //     builder: (context) => MainEditProfileForm()));
              },
              icon: Icon(Icons.edit_outlined),
              label: Text('Edit')),
        ]),
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
