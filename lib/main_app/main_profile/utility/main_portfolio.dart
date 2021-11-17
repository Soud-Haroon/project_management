// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_management/main_app/appbar/appbar.dart';

class MainPortfolio extends StatefulWidget {
  const MainPortfolio({Key? key}) : super(key: key);

  @override
  _MainPortfolioState createState() => _MainPortfolioState();
}

class _MainPortfolioState extends State<MainPortfolio> {

  final ImagePicker _picker = ImagePicker();

  XFile? image;
  XFile? changeImage;
  String? imagePath;
  String? fileName;
  List<String> _images = ["",];
  bool? change;

  Future pickImage() async {
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildMyAppBar(context, 'Portfolio', false, true),
      body: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 60),
                if (_images.length > 1)
                for (int i = 1; i < _images.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 133,
                    child: Image(
                      image: FileImage(File(_images[i])),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //-----------------------------------------------------//
                
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
                  pickImage();
                },
                child: Text('Attach Image',
                    style: TextStyle(
                        color: Color(0xff717171), fontSize: 13))),
                //------------------------------------------------------//
                SizedBox(height: 15),
                  // if(_images != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 60,
                            child: ElevatedButton(
                              child: const Text('SAVE',
                                  style:
                                      TextStyle(color: Colors.white)), //next button
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                // primary: Color(0xffC53B4B),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              onPressed: () {
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const MainDependent()));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
