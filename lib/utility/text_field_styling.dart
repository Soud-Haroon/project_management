// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

//---------------used in form---------------//
InputDecoration MyInputStyle(String hint) {
  return InputDecoration(
    hintStyle: const TextStyle(color: Color(0xff717279)),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0XFFC8C8C8)),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    labelText: hint,
  );
} 

//----------------------used in edit profile-----------------------------//
InputDecoration buildMyInputDecoration(BuildContext context, String hint) {
  return InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: Colors.transparent, width: 0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: Colors.transparent, width: 0),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.transparent, width: 0),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    filled: true,
    fillColor: Colors.white,
    labelText: hint,
    labelStyle: const TextStyle(fontSize: 12),
    // enabled: false,
    // hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
  );
}
