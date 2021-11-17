// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:project_management/main_app/navbar/main_navigation_bar.dart';

import 'forget_password/forget.dart';

//use welcome screen to run app
class MainSignUp extends StatelessWidget {
  MainSignUp({Key? key}) : super(key: key);
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
            height: MediaQuery.of(context).size.height * 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 1,
                    child: Image.asset(
                      'assets/myback3.png',
                      fit: BoxFit.fill,
                    )),
                //-------------------------------------------//
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Register',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(flex: 2),
                //--------------------------------------------//
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(children: [
                      TextFormField(
                          controller: _fullname,
                          decoration: InputDecoration(
                            hintText: "Full Name",
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                          ),

                          //----------------------------------//
                          validator: (value) {
                            const pattern = ('[a-zA-Z]+([\s][a-zA-Z]+)*');
                            final regExp = RegExp(pattern);

                            if (value!.isEmpty) {
                              return null;
                            } else if (!regExp.hasMatch(value)) {
                              return 'Enter only Alphabets';
                            } else {
                              return null;
                            }
                            //----------------------------------//
                          }),
                      const SizedBox(height: 20),
                      //-------------------------------------------------------//
                      TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                          ),

                          //----------------------------------//
                          validator: (value) {
                            const pattern =
                                (r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
                            final regExp = RegExp(pattern);

                            if (value!.contains(' ')) {
                              return 'Cant have blank spaces';
                            } else if (!regExp.hasMatch(value)) {
                              return 'Enter a valid email';
                            } else {
                              return null;
                            }
                            //----------------------------------//
                          }),
                      const SizedBox(height: 20),
                      //-------------------------------------------------------//
                      TextFormField(
                          controller: _password,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                          validator: (value) {
                            if (value!.contains(' ')) {
                              return 'Password can not contain blank Spaces';
                            } else if (value.length < 6) {
                              return 'Enter atleast 8 characters';
                            } else {
                              return null;
                            }
                          }),
                    ]),
                  ),
                ),
                Spacer(),
                //----------------------------------------------//
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SizedBox(
                          height: 50,
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainForget()));
                              },
                              child: Text(
                                'Forgot Password?',
                                // style: TextStyle(color: Colors.white),
                              ))),
                    ),
                  ],
                ),
                // Spacer(),
                //----------------------------------------------//
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 55,
                        width: 55,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          child: Image.asset('assets/icons/google_icon.png'),
                        ),
                      ),
                      SizedBox(width: 12),
                      //-------------------------//
                      SizedBox(
                        height: 55,
                        width: 55,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          child: Image.asset('assets/icons/facebook_icon.png'),
                        ),
                      ),
                      SizedBox(width: 12),
                      //-------------------------
                      SizedBox(
                        height: 55,
                        width: 55,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          child: Image.asset('assets/icons/apple_icon.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 4),
                //----------------------------------------------//
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {}, child: Text('New Here? Register')),
                      //----------------------------//
                      SizedBox(
                          height: 50,
                          width: 120,
                          child: ElevatedButton(
                              onPressed: () {
                                // if (_email.text.isNotEmpty &&
                                //     _password.text.isNotEmpty &&
                                //     _fullname.text.isNotEmpty) {
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => MainNavBar()));
                                // }
                                // if (_email.text.isEmpty ||
                                //     _password.text.isEmpty ||
                                //     _fullname.text.isEmpty) {
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //     SnackBar(
                                //       content: Text(
                                //           "Please Fill out all Field's..!"),
                                //     ),
                                //   );
                                // }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(8), // <-- Radius
                                ),
                              ),
                              child: Text(
                                'Sign up',
                                style: TextStyle(color: Colors.white),
                              ))),
                    ],
                  ),
                ),
                Spacer(flex: 2),
              ],
            )),
      ),
    );
  }
}
