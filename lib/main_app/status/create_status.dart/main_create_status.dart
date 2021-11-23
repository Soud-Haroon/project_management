// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:project_management/main_app/appbar/appbar.dart';
import 'package:project_management/main_app/status/main_status.dart';
import 'package:project_management/main_app/status/model/list_of_status.dart';
import 'package:project_management/utility/text_field_styling.dart';

import '../../../utility/const_colors.dart';

class MainCreateStatus extends StatefulWidget {
  const MainCreateStatus({Key? key}) : super(key: key);

  @override
  State<MainCreateStatus> createState() => _MainCreateStatusState();
}

class _MainCreateStatusState extends State<MainCreateStatus> {
  @override
  Widget build(BuildContext context) {
    TextEditingController statusName = TextEditingController();
  var _dropdownValue;
  bool active = false;
  bool inactive = false;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffF6F0EA),
      appBar: buildMyAppBar(context, 'Create Status', false, true),
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //--------------------------------------------------//
                TextFormField(
                  controller: statusName,
                  textInputAction: TextInputAction.next,
                  decoration: buildMyInputDecoration(context, 'Status Name'),
                ),
                //----------------------------------------------------//
                SizedBox(height: 10),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.transparent,
                      width: 0,
                    ),
                  ),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        labelText: "Color",
                        labelStyle: TextStyle(fontSize: 12, color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white),
                    value: _dropdownValue,
                    items: <String>['Green', 'Red', 'Yellow', 'Blue']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _dropdownValue = value;
                      });
                    },
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          active = !active;
                          inactive = false;
                        });
                      },
                      child: Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            curve: Curves.fastLinearToSlowEaseIn,
                            decoration: BoxDecoration(
                                color: active
                                    ? kPrimaryOrange
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10.0),
                                border: active
                                    ? null
                                    : Border.all(
                                        color: kPrimaryOrange,
                                        width: 2.0,
                                      )),
                            width: 20,
                            height: 20,
                            // child: _isSelected ? Icon(
                            //   Icons.check,
                            //   color: widget.selectedIconColor ?? Colors.white,
                            //   size: widget.iconSize ?? 20,
                            // ) : null,
                          ),
                          SizedBox(width: 20),
                          Text('Active'),
                        ],
                      ),
                    ),
                    SizedBox(width: 50),
                    //------------------------------------------------------//
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          inactive = !inactive;
                          active = false;
                        });
                      },
                      child: Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            curve: Curves.fastLinearToSlowEaseIn,
                            decoration: BoxDecoration(
                                color: inactive
                                    ? kPrimaryOrange
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10.0),
                                border: inactive
                                    ? null
                                    : Border.all(
                                        color: kPrimaryOrange,
                                        width: 2.0,
                                      )),
                            width: 20,
                            height: 20,
                            // child: _isSelected ? Icon(
                            //   Icons.check,
                            //   color: widget.selectedIconColor ?? Colors.white,
                            //   size: widget.iconSize ?? 20,
                            // ) : null,
                          ),
                          SizedBox(width: 20),
                          Text('InActive'),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        child: const Text('Create Status',
                            style:
                                TextStyle(color: Colors.white)), //next button
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          statusData.add(StatusModel(
                              title: statusName.text,
                              color: _dropdownValue,
                              status: active == true
                                  ? 'Active'
                                  : inactive == true
                                      ? 'InActive'
                                      : null));
                          //---------------------//
                          Navigator.pushReplacement<void, void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => const MainStatus(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),),
    );
  }
}

