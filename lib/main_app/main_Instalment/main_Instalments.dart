// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../utility/const_colors.dart';
import 'models/instalment_card_data.dart';

class MainInstalment extends StatefulWidget {
  const MainInstalment({Key? key}) : super(key: key);

  @override
  _MainInstalmentState createState() => _MainInstalmentState();
}

class _MainInstalmentState extends State<MainInstalment> {
  int totalSum = 0;
  int totalRemaining = 6;

  @override
  void initState() {
    super.initState();
    totalSum = 0;
    for (int i = 0; i < InstalmentCardData.length; i++) {
      totalSum = InstalmentCardData[i].instalment! + totalSum;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAF7F2),
      // appBar: buildMyAppBar(context, 'Instalments', false, true),
      body: Column(
        children: [
          const SizedBox(height: 10),
          totalHeaderBar(
              context: context,
              totalSum: totalSum,
              totalRemaining: totalRemaining),
          const SizedBox(height: 5),
          // MainInstalmentCard(myIndex: 1, startDate: '01-02-2020', dueDateFine: 5,instalment: 40,)
          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 7),
                itemCount: InstalmentCardData.length,
                itemBuilder: (context, index) {
                  // totalSum = InstalmentCardData[index].instalment! + totalSum;
                  return projectCard(
                    context: context,
                    myModel: InstalmentCardData[index],
                    myIndex: index + 1,
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget projectCard(
      {required BuildContext context,
      required MyCurrentIndex myModel,
      required int myIndex}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xffFF66B8),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 67,
              width: 5,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: myIndex.toString(),
                                style: TextStyle(fontSize: 16)),
                            TextSpan(
                                text: ' - instalment',
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(children: [
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: String.fromCharCodes(Runes('\u0024')),
                                    style: TextStyle(
                                        color: Color(0xff7E7F81),
                                        fontSize: 16)),
                                TextSpan(
                                    text: myModel.instalment.toString(),
                                    style: TextStyle(
                                        color: Color(0xff7E7F81),
                                        fontSize: 16)),
                              ],
                            ),
                          ),
                          SizedBox(width: 15),
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Color(0xffA9BACC),
                            child: ClipRect(
                              child: Icon(Icons.done,
                                  color: Colors.white, size: 20),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                  // SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, right: 25),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Due Date: ',
                                    style: TextStyle(
                                        color: Color(0xffA880E3),
                                        fontSize: 12)),
                                TextSpan(
                                    text: myModel.startDate,
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'After Due Date: ',
                                    style: TextStyle(
                                        color: Color(0xffFBBC00),
                                        fontSize: 12)),
                                TextSpan(
                                    text: String.fromCharCodes(Runes('\u0024')),
                                    style: TextStyle(fontSize: 12)),
                                TextSpan(
                                    text: myModel.dueDateFine.toString(),
                                    style: TextStyle(fontSize: 12)),
                                TextSpan(
                                    text: ' + due amount',
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ),
                        ]),
                  ),
                  // SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//====================================================================//
  Widget totalHeaderBar(
      {required BuildContext context, int? totalSum, int? totalRemaining}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: cusOrange,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 7),
                    child: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          // ignore: unnecessary_new
                          TextSpan(
                              text: String.fromCharCodes(Runes('\u0024 ')),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          TextSpan(
                              text: totalSum.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 1),
                    child: Text('Total installment',
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 7),
                    child: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          // ignore: unnecessary_new
                          TextSpan(
                              text: String.fromCharCodes(Runes('\u0024 ')),
                              style: TextStyle(
                                  color: Color(0xff4C6683),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          TextSpan(
                              text: totalRemaining.toString(),
                              style: TextStyle(
                                  color: Color(0xff4C6683),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 1),
                    child: Text('Remaining installment',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff4C6683))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
