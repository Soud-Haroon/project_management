// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
import 'package:flutter/material.dart';

import '../../../const_colors.dart';

//use welcome screen to run app
class MainResetPassword extends StatelessWidget {
  const MainResetPassword({Key? key}) : super(key: key);

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
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/myback3.png'),
                      colorFilter: ColorFilter.mode(
                          Color(0xfff6f3ea).withOpacity(0.4),
                          BlendMode.dstATop),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // SizedBox(height: 20),
                //-------------------------------------------//
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Reset your password',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                //----------------------------------------------//
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: SizedBox(
                      height: 60,
                      child: Text(
                        'Please create your new passowrd and enjoy the destination app',
                        style: TextStyle(color: Colors.grey),
                      )),
                ),
                // Spacer(),
                //----------------------------------------------//
                Spacer(flex: 1),
                _ResetPasswordCard(),
                Spacer(flex: 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => ResetYourPassword()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryOrange,
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      child: Text(
                        'SAVE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            )),
      ),
    );
  }
}
//===========================================================//

class _ResetPasswordCard extends StatelessWidget {
  _ResetPasswordCard({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  var password;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            // Add TextFormFields and RaisedButton here.
            TextFormField(
                obscureText: true,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Create Password",
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                ),
                controller: _pass,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) return 'Empty';
                  return null;
                }),
            SizedBox(height: 20),
            //------------------------//
            TextFormField(
                obscureText: true,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: "Verify Password",
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                ),
                controller: _confirmPass,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) return 'Empty';
                  if (value != _pass.text) return 'Password Not Match';
                  if (value == _pass.text) return 'Password Match';
                  return null;
                }),
          ],
        ),
      ),
    );
  }
}
