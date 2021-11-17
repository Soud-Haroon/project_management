// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'log/log_in.dart';

//use welcome screen to run app
class MainAppStaterPage extends StatelessWidget {
  const MainAppStaterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      SizedBox(height: MediaQuery.of(context).size.height*0.70,
      width: MediaQuery.of(context).size.width * 1,
       child: Image.asset('assets/main_back.png',fit: BoxFit.fitWidth,)),
      Spacer(),
      // SizedBox(height: 20),
      //-------------------------------------------//
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          'Plan, Build and Track',
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      Spacer(flex: 2),
      //--------------------------------------------//
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          'We have discussed about post-vacation plan and our decision is to Bali.',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.color
                  ?.withOpacity(0.64)),
        ),
      ),
      Spacer(flex: 2),
      //----------------------------------------------//
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainLogIn()));
                    },
                    child: Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white),
                    ))),
          ),
        ],
      ),
      Spacer(flex: 2),
        ],
      ),
    );
  }
}
