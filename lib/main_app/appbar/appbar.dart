import 'package:flutter/material.dart';
import '../../const_colors.dart';

AppBar buildMyAppBar(BuildContext context, String name, bool bellicon , bool backicon) {
  
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    automaticallyImplyLeading: false,
    leading: 
    IconButton(
      icon: backicon == true ? const Icon(Icons.arrow_back_ios) : const SizedBox(),
      color: MediaQuery.of(context).platformBrightness == Brightness.light
          ? kContentColorLightTheme
          : Colors.grey,
      onPressed: () => Navigator.of(context).pop(),
    ),
    title: Text(
      name,
      style: TextStyle(
          color: MediaQuery.of(context).platformBrightness == Brightness.light
              ? kContentColorLightTheme
              : Colors.grey),
    ),
    actions: <Widget>[
      if(bellicon==true)
        IconButton(
          //bell Icon
          icon: Icon(
            Icons.tune,
            color: MediaQuery.of(context).platformBrightness == Brightness.light
                ? kContentColorLightTheme
                : Colors.grey,
          ),
          onPressed: () {
            // Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => MainNotification()));
          },
        )
    ],
  );
}
