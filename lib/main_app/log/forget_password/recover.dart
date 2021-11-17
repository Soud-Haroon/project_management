// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_element

import 'package:flutter/material.dart';

import '../../../const_colors.dart';
import 'reset.dart';

//use welcome screen to run app
class MainRecover extends StatelessWidget {
  const MainRecover({Key? key}) : super(key: key);

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
                  height: MediaQuery.of(context).size.height * 0.50,
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
                    'Enter 4-digit recovery code',
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
                        'The recovery code was sent to your mobile number. please enter the code.',
                        style: TextStyle(color: Colors.grey),
                      )),
                ),
                // Spacer(),
                //----------------------------------------------//
                Spacer(flex: 1),
                _RecoveryCards(),
                Spacer(flex: 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MainResetPassword()));
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
                        'NEXT',
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

class _RecoveryCards extends StatelessWidget {
  _RecoveryCards({Key? key}) : super(key: key);

  final node0 = FocusNode();
  final node1 = FocusNode();
  final node2 = FocusNode();
  final node3 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            height: 66,
            width: 61,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              focusNode: node0,
              style: TextStyle(fontSize: 42),
              textAlign: TextAlign.center,
              maxLength: 1,
              decoration: InputDecoration(
                  isDense: true, border: InputBorder.none, counter: Offstage()),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  FocusScope.of(context).requestFocus(node1);
                }
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 66,
            width: 61,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              focusNode: node1,
              style: TextStyle(fontSize: 42),
              textAlign: TextAlign.center,
              maxLength: 1,
              decoration: InputDecoration(
                  isDense: true, border: InputBorder.none, counter: Offstage()),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  FocusScope.of(context).requestFocus(node2);
                }
                if (value.isEmpty) {
                  FocusScope.of(context).requestFocus(node0);
                }
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 66,
            width: 61,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              focusNode: node2,
              style: TextStyle(fontSize: 42),
              textAlign: TextAlign.center,
              maxLength: 1,
              decoration: InputDecoration(
                  isDense: true, border: InputBorder.none, counter: Offstage()),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  FocusScope.of(context).requestFocus(node3);
                }
                if (value.isEmpty) {
                  FocusScope.of(context).requestFocus(node1);
                }
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 66,
            width: 61,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              focusNode: node3,
              style: TextStyle(fontSize: 42),
              textAlign: TextAlign.center,
              maxLength: 1,
              decoration: InputDecoration(
                  isDense: true, border: InputBorder.none, counter: Offstage()),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isEmpty) {
                  FocusScope.of(context).requestFocus(node2);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
