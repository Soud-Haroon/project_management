// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_management/main_app/appbar/appbar.dart';
import '../../utility/const_colors.dart';
import 'create_user.dart/main_create_user.dart';
import 'utility/user_model.dart';

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
                itemBuilder: (context, index) {
                  return userCard(context: context,userCardModel: userCardData[index]);
                }),
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
  //--------------------------------------------------------------//
  Widget userCard({required BuildContext context, UserCardModel? userCardModel}) {
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
                  child: Image.asset("assets/persons/${userCardModel!.imagePath}.png"),
                ),
              ),
              //======================================//
              const SizedBox(width: 20),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(userCardModel.userName!,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    // SizedBox(height: 15),
                    Text(userCardModel.userDesignation!,
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
