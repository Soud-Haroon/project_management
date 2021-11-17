// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:project_management/main_app/appbar/appbar.dart';

import 'utility/profile_form.dart';

class MainProfile extends StatelessWidget {
  const MainProfile({Key? key}) : super(key: key);

  // final keyProfile = GlobalKey<_MainHomeProfileState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.transparent,
      appBar: buildMyAppBar(context, 'Profile', false, true),
      body: MainProfileForm(),
    );
  }
}



