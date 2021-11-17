// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String imageName;
  // final VoidCallback? press;
  UserCard(this.imageName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          // Navigator.push(context,
          // MaterialPageRoute(builder: (context) => const MyTeamProfile()));
        },
        child: Container(
          height: 80,
          // width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(color: Colors.transparent, width: 0),
            //========================================//
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],
          ),

          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              CircleAvatar(
                radius: (35),
                backgroundColor: Colors.transparent,
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(50),
                  child: Image.asset("assets/persons/$imageName.png"),
                ),
              ),
              //======================================//
              const SizedBox(width: 20),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Lee Williamson',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    // SizedBox(height: 15),
                    Text('Designation',
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ]),
            ]),
            //===============================================//
            const SizedBox(),
          ]),
        ),
      ),
    );
  }
}
