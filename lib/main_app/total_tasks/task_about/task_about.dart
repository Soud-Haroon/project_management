// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math' as math;

import '../../../const_colors.dart';


class MainTaskAbout extends StatelessWidget {
  const MainTaskAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back_ios_new, color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.edit_outlined, color: Colors.white))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                child: Image.asset(
                  'assets/content/imageback2.png',
                  height: 230,
                  fit: BoxFit.cover,
                )),
            //---------------------------------------------------------//
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text('Appartment no 01',
                        style:
                        TextStyle(fontSize: 22, color: Color(0xff464646))),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(Icons.access_time, color: Colors.grey),
                          SizedBox(width: 10),
                          Text('Start Date: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13)),
                          Text('10-12-2021', style: TextStyle(fontSize: 13)),
                        ]),
                        Row(children: [
                          Text('End Date: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13)),
                          Text('10-12-2021', style: TextStyle(fontSize: 13)),
                        ]),
                      ]),
                  SizedBox(height: 5),
                  Divider(),
                  SizedBox(height: 5),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(Icons.flash_on_outlined, color: Colors.grey),
                          SizedBox(width: 10),
                          Text('Status', style: TextStyle(fontSize: 13)),
                        ]),
                        Container(
                            height: 27,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: kInProgressColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text('IN PROGRESS',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.white)),
                            )),
                      ]),
                  SizedBox(height: 5),
                  Divider(),
                  SizedBox(height: 5),
                  Row(children: [
                    Icon(
                      Icons.description_outlined,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 10),
                    Text('Description', style: TextStyle(fontSize: 13)),
                  ]),
                  SizedBox(height: 10),
                  Text(_content, style: TextStyle(fontSize: 13)),
                  SizedBox(height: 20),
                  Row(children: [
                    Transform.rotate(
                        angle: -math.pi / 11.0,
                        // angle: 60 * math.pi / 60,
                        child: Icon(Icons.attach_file)),
                    SizedBox(width: 10),
                    Text('Attachments', style: TextStyle(fontSize: 15)),
                    SizedBox(width: 10),
                    Container(
                      height: 25,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.black,
                      ),
                      child: Center(
                          child:
                          Text('2', style: TextStyle(color: Colors.white))),
                    ),
                  ]),
                  SizedBox(height: 20),
                  Row(children: [
                    Image.asset('assets/content/content1.png', height: 100),
                    Image.asset('assets/content/content2.png', height: 100),
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

String _content =
    'Hello guys, we have discussed about post-corona vacation plan and our decision is to go to Bali. Hello guys, we have discussed about post-corona vacation plan and our decision is to go to Bali. Hello guys, we have discussed about post-corona vacation plan and our decision is to go to Bali. Hello guys, we have discussed about post-corona vacation plan and our decision is to go to Bali. ';
