import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
InputDecoration MyInputStyle(String hint) {
  return InputDecoration(
    hintStyle: const TextStyle(color: Color(0xff717279)),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0XFFC8C8C8)),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    labelText: hint,
  );
}  //===================================================================//
