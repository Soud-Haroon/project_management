// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:project_management/main_app/milestones/main_milestones.dart';

import '../../../const_colors.dart';

class MainBloackCard extends StatefulWidget {
  String blockheader;

  String blockstartDate;
  String blockendDate;

  int appartments;

  MainBloackCard({
    Key? key,
    required this.blockheader,
    required this.blockstartDate,
    required this.blockendDate,
    required this.appartments,
  }) : super(key: key);

  @override
  State<MainBloackCard> createState() => _MainBloackCardState();
}

class _MainBloackCardState extends State<MainBloackCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10),
      child: GestureDetector(
        onTap: () {
          // Navigator.of(context).push(
          //     MaterialPageRoute(builder: (context) => MainMilestones()));
        },
        child: Container(
          height: 158,
          width: 204,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.withOpacity(0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                SizedBox(
                    height: 24,
                    child: Text(widget.blockheader,
                        style: TextStyle(fontSize: 16))),
                // InkWell(
                //   onTap: (){},
                //   hoverColor: Color(0xffD84343),
                //   child: Icon(Icons.edit_outlined,
                //       color: Color(0xffD84343)),
                // ),
                Icon(Icons.edit_outlined, color: Color(0xffD84343)),
              ]),
              SizedBox(height: 5),
              //=====================================//
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: SizedBox(
                  height: 20,
                  child: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Start Date:     ',
                            style: TextStyle(fontSize: 12)),
                        TextSpan(
                            text: widget.blockstartDate,
                            style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ),
              //----------------------------------------------------//
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: SizedBox(
                  height: 20,
                  child: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'End Date:     ',
                            style: TextStyle(fontSize: 12)),
                        TextSpan(
                            text: widget.blockendDate,
                            style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ),
              //----------------------------------------------------//
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: SizedBox(
                  height: 20,
                  child: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Appartments::     ',
                            style: TextStyle(fontSize: 12)),
                        TextSpan(
                            text: widget.appartments.toString(),
                            style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ),
              //-----------------------------------------------------//
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                    height: 27,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: kInProgressColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text('IN PROGRESS',
                          style: TextStyle(fontSize: 11, color: Colors.white)),
                    )),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
