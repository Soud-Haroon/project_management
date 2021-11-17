// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project_management/main_app/appbar/appbar.dart';

import '../../const_colors.dart';
import 'models/instalment_card_data.dart';
import 'utility/instalment_card.dart';

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
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffFAF7F2),
      appBar: buildMyAppBar(context, 'Instalments', false, true),
      body: Column(
        children: [
          const SizedBox(height: 60),
          TotalHeader(totalSum: totalSum, totalRemaining: totalRemaining),
          const SizedBox(height: 5),
          // MainInstalmentCard(myIndex: 1, startDate: '01-02-2020', dueDateFine: 5,instalment: 40,)
          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 7),
                itemCount: InstalmentCardData.length,
                itemBuilder: (context, index) {
                  // totalSum = InstalmentCardData[index].instalment! + totalSum;
                  return MainInstalmentCard(
                    myModel: InstalmentCardData[index],
                    myIndex: index + 1,
                  );
                }),
          )
        ],
      ),
    );
  }
}

class TotalHeader extends StatelessWidget {
  const TotalHeader({
    Key? key,
    required this.totalSum,
    required this.totalRemaining,
  }) : super(key: key);

  final int totalSum;
  final int totalRemaining;

  @override
  Widget build(BuildContext context) {
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
