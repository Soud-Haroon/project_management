// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_management/main_app/appbar/appbar.dart';

import 'utility/create_actform.dart';

class MainCreateActivity extends StatelessWidget {
  const MainCreateActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: buildMyAppBar(context, 'Create Activity', false, true),
      backgroundColor: Color(0xffE5E5E5),
      body: MyCreateActForm(),
    );
  }
}
