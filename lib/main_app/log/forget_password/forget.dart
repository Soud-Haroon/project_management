// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, must_be_immutable
import 'package:flutter/material.dart';

import 'recover.dart';

//use welcome screen to run app
class MainForget extends StatelessWidget {
  const MainForget({Key? key}) : super(key: key);

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
                Spacer(),
                // SizedBox(height: 20),
                //-------------------------------------------//
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Forgot Password',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                //----------------------------------------------//
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: SizedBox(
                      height: 50,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'How to verify your password reset request?',
                            style: TextStyle(color: Colors.grey),
                          ))),
                ),
                // Spacer(),
                //----------------------------------------------//
                Spacer(flex: 1),
                ResetByNumberCard(press: () {
                  Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MainRecover()));
                }),
                ResetByEmailCard(press: () {}),
                Spacer(flex: 3),
              ],
            )),
      ),
    );
  }
}

//===========================================================//

class ResetByNumberCard extends StatelessWidget {
  String? text;
  VoidCallback? press;
  ResetByNumberCard({Key? key, this.text, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        onTap: press,
        child: Container(
          height: 108,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            border: Border.all(color: Colors.grey.withOpacity(0.1), width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Icon(
                    Icons.app_settings_alt_outlined,
                    size: 50,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('via sms:', style: TextStyle(fontSize: 15)),
                      SizedBox(height: 5),
                      Text(
                          //on card
                          '.... .... 9011',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//=======================================================================//
class ResetByEmailCard extends StatelessWidget {
  String? text;
  VoidCallback? press;
  ResetByEmailCard({Key? key, this.text, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        onTap: press,
        child: Container(
          height: 108,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            border: Border.all(color: Colors.grey.withOpacity(0.1), width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Icon(
                    Icons.mail_outline,
                    size: 50,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('via email:', style: TextStyle(fontSize: 15)),
                      SizedBox(height: 5),
                      Text(
                          //on card
                          '.... ....el@gmail.com',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
