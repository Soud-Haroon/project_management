// ignore_for_file: prefer_const_declarations, duplicate_ignore, prefer_typing_uninitialized_variables, prefer_const_constructors, unnecessary_new, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:project_management/main_app/main_project/Models/projectb_data.dart';
import 'package:project_management/main_app/main_project/main_project.dart';
import 'my_textfieldstyle.dart';

enum Gender { male, female }

class MyCreateProjectForm extends StatefulWidget {
  const MyCreateProjectForm({Key? key}) : super(key: key);


  @override
  _MyCreateProjectFormState createState() => _MyCreateProjectFormState();
}

class _MyCreateProjectFormState extends State<MyCreateProjectForm> {
  // ignore: prefer_typing_uninitialized_variables
  TextEditingController _projectName = new TextEditingController();
  TextEditingController _area = new TextEditingController();
  TextEditingController _ownerName = new TextEditingController();
  TextEditingController _companyName = new TextEditingController();
  TextEditingController _salePrice = new TextEditingController();
  TextEditingController _downpayment = new TextEditingController();
  TextEditingController _instalmentAmount = new TextEditingController();
  TextEditingController _description = new TextEditingController();

  final maskFormatter = MaskTextInputFormatter(mask: '+92 ### ### ####');
  var gender;
  var _startDate;
  var _endDate;
  var _dueDate;
  var _typeValue;
  var _installmentValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 1,
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: _projectName,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      decoration: MyInputStyle('Project Name'),
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
                            labelText: "Type",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0XFFC8C8C8)),
                            ),
                            prefixStyle: TextStyle(color: Colors.grey),
                            fillColor:
                                Theme.of(context).scaffoldBackgroundColor),
                        value: _typeValue,
                        items: <String>['Software', 'Hardware']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _typeValue = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    //-------------------------------------------------//
                    TextFormField(
                      controller: _area,
                      textInputAction: TextInputAction.next,
                      decoration: MyInputStyle('Area'),
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
                    TextFormField(
                      controller: _ownerName,
                      textInputAction: TextInputAction.next,
                      decoration: MyInputStyle('Owner Name'),
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (value) {
                      //   final pattern =
                      //       (r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
                      //   final regExp = RegExp(pattern);

                      //   if (value!.isEmpty) {
                      //     return null;
                      //   } else if (value.contains(' ')) {
                      //     return 'can not have blank spaces';
                      //   } else if (!regExp.hasMatch(value)) {
                      //     return 'Enter a valid email';
                      //   } else {
                      //     return null;
                      //   }
                      // },
                    ),
                    const SizedBox(height: 15),
                    //-------------------------------------------------//
                    TextFormField(
                      controller: _companyName,
                      textInputAction: TextInputAction.next,
                      decoration: MyInputStyle('Company Name'),
                      // keyboardType: TextInputType.number,
                      // inputFormatters: [maskFormatter],
                      // validator: (value) {
                      //   final regExp = RegExp('[0-9]');
                      //   if (value!.isEmpty) {
                      //     return null;
                      //   } else if (!regExp.hasMatch(value)) {
                      //     return 'Enter only number';
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
                                            initialDate: DateTime(2018),
                                        firstDate: DateTime(2017),
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
                                            initialDate: DateTime(2018),
                                        firstDate: DateTime(2017),
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
                      ],
                    ),
                    const SizedBox(height: 10),
                    //-------------------------------------------------//
                    TextFormField(
                      controller: _salePrice,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: MyInputStyle('Sale Price'),
                      // keyboardType: TextInputType.number,
                      // inputFormatters: [maskFormatter],
                      // validator: (value) {
                      //   final regExp = RegExp('[0-9]');
                      //   if (value!.isEmpty) {
                      //     return null;
                      //   } else if (!regExp.hasMatch(value)) {
                      //     return 'Enter only number';
                      //   } else {
                      //     return null;
                      //   }
                      // },
                    ),
                    const SizedBox(height: 15),
                    //-------------------------------------------------//
                    TextFormField(
                      controller: _downpayment,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: MyInputStyle('Down Payment'),
                      // keyboardType: TextInputType.number,
                      // inputFormatters: [maskFormatter],
                      // validator: (value) {
                      //   final regExp = RegExp('[0-9]');
                      //   if (value!.isEmpty) {
                      //     return null;
                      //   } else if (!regExp.hasMatch(value)) {
                      //     return 'Enter only number';
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
                            labelText: "Instalments",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0XFFC8C8C8)),
                            ),
                            prefixStyle: TextStyle(color: Colors.grey),
                            fillColor:
                                Theme.of(context).scaffoldBackgroundColor),
                        value: _installmentValue,
                        items: <String>['5', '7', '12']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _installmentValue = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    //-------------------------------------------------//
                    SizedBox(
                      height: 20,
                      child: Text(
                        'Installment Lorem ipsum dollar sit imet',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    const SizedBox(height: 10),
                    //-------------------------------------------------//
                    TextFormField(
                      controller: _instalmentAmount,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: MyInputStyle('Installment Amount'),
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
                    Container(
                      height: 50,
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
                              _dueDate == null
                                  ? 'Due Date'
                                  : '${_dueDate!.day}/${_dueDate!.month}/${_dueDate!.year}'
                                      .toString(),
                              style: TextStyle(color: Color(0xff717279)),
                            ),
                          ),
                          IconButton(
                              icon: Icon(Icons.today, color: Colors.grey),
                              onPressed: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime(2018),
                                        firstDate: DateTime(2017),
                                        lastDate: DateTime(2021))
                                    .then((value) {
                                  setState(() {
                                    _dueDate = value;
                                  });
                                });
                              }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    //----------------------------------------------------//
                    TextFormField(
                      controller: _description,
                      textInputAction: TextInputAction.done,
                      decoration: MyInputStyle('Description'),
                      maxLines: 5,
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
                    const SizedBox(height: 20),
                    //-------------------------------------------------//
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 60,
                        child: ElevatedButton(
                          child: const Text('Create Project',
                              style:
                                  TextStyle(color: Colors.white)), //next button
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => NavBar(0)));
                            if (_projectName.text.isEmpty
                                ||
                                _ownerName.text.isEmpty ||
                                _companyName.text.isEmpty ||
                                _area.text.isEmpty ||
                                _salePrice.text.isEmpty ||
                                _description.text.isEmpty ||
                                _installmentValue == null ||
                                _instalmentAmount.text.isEmpty ||
                                _startDate == null ||
                                _endDate == null ||
                                _dueDate == null ||
                                _typeValue == null
                            ) {
                              var snackBar = SnackBar(
                                  content: Text('Please fill all forms...!'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              setState(() {
                                projectData.add(ProjectDetailModel(
                                    projectName: _projectName.text,
                                    ownerName: _ownerName.text,
                                    companyName: _companyName.text,
                                    salePrice: _salePrice.text,
                                    description: _description.text,
                                    startDate: _startDate,
                                    endDate: _endDate,
                                    type: _typeValue,
                                    installment: _installmentValue,
                                    installmentAmount: _instalmentAmount.text,
                                    area: _area.text,
                                    downpayment: _downpayment.text,
                                    dueDate: _dueDate));
                                Navigator.of(context).pop();
                              });
                              MainProjectPage.counter.value += 1;
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//===================================================//
