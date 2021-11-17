// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_management/main_app/appbar/appbar.dart';

import '../../const_colors.dart';
import 'create_user.dart/main_create_user.dart';
import 'utility/list_of_user.dart';

class MainUser extends StatefulWidget {
  const MainUser({Key? key}) : super(key: key);

  @override
  State<MainUser> createState() => _MainUserState();
}

class _MainUserState extends State<MainUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffF6F0EA),
      appBar: buildMyAppBar(context, 'Users', false, true),
      body: ListView.builder(
                itemCount: userCardData.length,
                itemBuilder: (context, index) => userCardData[index]),
      //-----------------------------------//
      floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
        // Add your onPressed code here!
                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => CreateUser()));
      },
      label: const Text('Add User', style: TextStyle(fontSize: 11)),
      icon: const Icon(Icons.add, color: kPrimaryOrange, size: 30,),
      backgroundColor: const Color(0xffC8DFF5),
    ),
    );
  }
}
