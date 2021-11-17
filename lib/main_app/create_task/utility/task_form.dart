// ignore_for_file: prefer_const_declarations, duplicate_ignore, prefer_typing_uninitialized_variables, prefer_const_constructors, unnecessary_new, prefer_final_fields, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_management/main_app/create_milestone/utility/my_miletextstylefield.dart';
import 'package:project_management/main_app/main_project/Models/projectb_data.dart';

enum Gender { male, female }

class MyCreateTaskForm extends StatefulWidget {
  MyCreateTaskForm({this.projectModel,this.index ,Key? key}) : super(key: key);
  ProjectDetailModel? projectModel;
  int? index;
  @override
  _MyCreateTaskFormState createState() => _MyCreateTaskFormState();
}

class _MyCreateTaskFormState extends State<MyCreateTaskForm> {
  // ignore: prefer_typing_uninitialized_variables
  TextEditingController _taskName = new TextEditingController();
  TextEditingController _description = new TextEditingController();
  final ImagePicker _picker = ImagePicker();

  String? fileName;
  DateTime? _startDate;
  DateTime? _endDate;
//-------------------//
  XFile? image;
  String? imagePath;
  List<String> _images = [
    "",
  ];
  bool? change;

  Future pickImage(bool add) async {
    try {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;

      setState(() {
        imagePath = image.path;
        if (change != true) {
          _images.add(image.path);
        }

        // this.image = imageTemp;
        // saveImage(this.image);
      });
      File file = new File(imagePath!);
      fileName = file.path.split('/').last;
      // saveImage('SaveImage',image.path);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Access Rejected: $e');
    }
  }

  void delete() {
    fileName = null;
    imagePath = null;
  }

  var _statusValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 1,
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //-------------------------------------------------//
                  TextFormField(
                    controller: _taskName,
                    textInputAction: TextInputAction.next,
                    decoration: MyInputStyle('Task Name'),
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    // validator: (value) {
                    //   final pattern = ('[a-zA-Z]+([\s][a-zA-Z]+)*');
                    //   final regExp = RegExp(pattern);
                    //   if (value!.isEmpty) {
                    //     return null;
                    //   } else if (!regExp.hasMatch(value)) {
                    //     return 'Enter only Alphabets';
                    //   } else {
                    //     return null;
                    //   }
                    // },
                  ),
                  const SizedBox(height: 15),
                  //-------------------------------------------------//
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 168,
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Color(0XFFC8C8C8))),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  _startDate == null
                                      ? 'Start Date'
                                      : '${_startDate!.day}/${_startDate!.month}/${_startDate!.year}'
                                          .toString(),
                                  style: TextStyle(color: Color(0xff717279)),
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.today,
                                      color: Color(0xff717279)),
                                  onPressed: () {
                                    showDatePicker(
                                            context: context,
                                            initialDate: DateTime(2010),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2021))
                                        .then((value) {
                                      setState(() {
                                        _startDate = value;
                                      });
                                    });
                                  }),
                            ],
                          ),
                        ),
                        //------------------------//
                        Container(
                          height: 50,
                          width: 168,
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Color(0XFFC8C8C8))),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  _endDate == null
                                      ? 'End Date'
                                      : '${_endDate!.day}/${_endDate!.month}/${_endDate!.year}'
                                          .toString(),
                                  style: TextStyle(color: Color(0xff717279)),
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.today,
                                      color: Color(0xff717279)),
                                  onPressed: () {
                                    showDatePicker(
                                            context: context,
                                            initialDate: DateTime(2010),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2021))
                                        .then((value) {
                                      setState(() {
                                        _endDate = value;
                                      });
                                    });
                                  }),
                            ],
                          ),
                        ),
                      ]),
                  const SizedBox(height: 10),
                  //-------------------------------------------------//

                  TextFormField(
                    controller: _description,
                    maxLines: 5,
                    textInputAction: TextInputAction.done,
                    decoration: MyInputStyle('Description'),
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    // validator: (value) {
                    //   final pattern = ('[a-zA-Z]+([\s][a-zA-Z]+)*');
                    //   final regExp = RegExp(pattern);
                    //   if (value!.isEmpty) {
                    //     return null;
                    //   } else if (!regExp.hasMatch(value)) {
                    //     return 'Enter only Alphabets';
                    //   } else {
                    //     return null;
                    //   }
                    // },
                  ),
                  const SizedBox(height: 15),
                  //-------------------------------------------------//
                  SizedBox(
                    height: 50,
                    // padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          labelText: "Status",
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0XFFC8C8C8)),
                          ),
                          prefixStyle: TextStyle(color: Colors.grey),
                          fillColor: Theme.of(context).scaffoldBackgroundColor),
                      value: _statusValue,
                      items: <String>['IN PROGRESS', 'ON HOLD', 'DONE']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _statusValue = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  //-------------------------------------------------//
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Icon(Icons.attach_file),
                        Text(
                          'Attachment',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  //-------------------------------------------------//
                  // if (imagePath == null) SizedBox(),
                  if (_images.length > 1)
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 1; i < _images.length; i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: SizedBox(
                                height: 70,
                                child: Row(
                                  children: [
                                    Image(
                                      image: FileImage(File(_images[i])),
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 140,
                                            child: Text(
                                              fileName!,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                          ),
                                          Row(children: [
                                            TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _images.removeAt(i);
                                                  });
                                                },
                                                child: Text(
                                                  'Delete',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.red,
                                                      decoration: TextDecoration
                                                          .underline),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  _picker.pickImage(
                                                      source:
                                                          ImageSource.gallery);
                                                  setState(() {
                                                    _images[i] = imagePath!;
                                                  });
                                                },
                                                child: Text(
                                                  'Change',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.blue,
                                                      decoration: TextDecoration
                                                          .underline),
                                                )),
                                          ]),
                                        ]),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  //-------------------------------------------------//
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          color: Colors.grey.shade400)))),
                      onPressed: () {
                        pickImage(false);
                      },
                      child: Text('Attach Image',
                          style: TextStyle(
                              color: Color(0xff717171), fontSize: 13))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        child: const Text('Create Task',
                            style:
                                TextStyle(color: Colors.white)), //next button
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          if (_taskName.text.isEmpty ||
                              _description.text.isEmpty ||
                              _startDate == null ||
                              _endDate == null) {
                            var snackBar = SnackBar(
                                content: Text('Please fill all forms...!'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            setState(() {
                              widget.projectModel!.milestone[widget.index!].taskList.add(TaskModel(
                                taskTitle: _taskName.text,
                              ));
                              Navigator.of(context).pop();
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//===================================================//

