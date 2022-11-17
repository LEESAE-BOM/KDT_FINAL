import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../../constants.dart';
import '../../../theme.dart';
import './quiz/result.dart';
//행동학습
class expressLearn2 extends StatefulWidget {
  expressLearn2({Key? key
    , this.title
    , required this.imgsrc
    , required this.point
    , required this.answer
  }) : super(key: key);
  final String? imgsrc;
  final int? point;
  final int? answer;
  final String? title;

  @override
  _expressLearn2 createState() => _expressLearn2();
}

class _expressLearn2 extends State<expressLearn2> {
  Uint8List? swaped_string;
  List<int> pointlist= [0,0,0,0];

  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_){
    //   patchUserProfileImage;
    // });

  }

  @override
  Widget build(BuildContext context) {
    String? imgsrc = widget.imgsrc;
    swaped_string = base64Decode(imgsrc!);
    int? answer = widget.answer;
    int? point = widget.point;
    pointlist[answer!] =10;
    // TODO: implement build
    return Scaffold(
        body:
        SingleChildScrollView(
            child:Column(
              children: <Widget>[
                SizedBox(height:20),
                Center(
                    child: Text.rich(
                      TextSpan(
                          text: '본인 얼굴로 합성된 표정을',
                          style: textTheme().headline1?.copyWith(
                              color: kTextColor ,fontSize: 25,fontWeight: FontWeight.bold)
                      ),textAlign: TextAlign.center,
                    )
                ),
                Center(
                    child: Text.rich(
                      TextSpan(
                          text: '맞춰보세요!',
                          style: textTheme().headline1?.copyWith(
                              color: kTextColor ,fontSize: 25,fontWeight: FontWeight.bold)
                      ),textAlign: TextAlign.center,
                    )
                ),
                LoadingImage(swaped_string),
                SizedBox(
                    width: 100,
                    height: 40,
                    child: ElevatedButton(onPressed:(){Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Result(pointlist[0]+point!)),
                    );}, child: Text('행복',style: textTheme().headline1?.copyWith(
                        color: Colors.white ,fontSize: 20,fontWeight: FontWeight.bold)
                    ),
                        style: ElevatedButton.styleFrom(primary: Colors.blueAccent)
                    )),
                SizedBox(height: 20,),
                SizedBox(
                    width: 100,
                    height: 40,
                    child: ElevatedButton(onPressed:(){Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Result(pointlist[1]+point!)),
                    );}, child: Text('슬픔',style: textTheme().headline1?.copyWith(
                        color: Colors.white ,fontSize: 20,fontWeight: FontWeight.bold)
                    ),
                        style: ElevatedButton.styleFrom(primary: Colors.blueAccent)
                    )),
                SizedBox(height: 20,),
                SizedBox(
                    width: 100,
                    height: 40,
                    child: ElevatedButton(onPressed:(){Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Result(pointlist[2]+point!)),
                    );}, child: Text('무서움',style: textTheme().headline1?.copyWith(
                        color: Colors.white ,fontSize: 20,fontWeight: FontWeight.bold)
                    ),
                        style: ElevatedButton.styleFrom(primary: Colors.blueAccent)
                    )),
                SizedBox(height: 20,),
                SizedBox(
                    width: 100,
                    height: 40,
                    child: ElevatedButton(onPressed:(){Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Result(pointlist[3]+point!)),
                    );}, child: Text('화남',style: textTheme().headline1?.copyWith(
                        color: Colors.white ,fontSize: 20,fontWeight: FontWeight.bold)
                    ),
                        style: ElevatedButton.styleFrom(primary: Colors.blueAccent)
                    )),
                // SizedBox(
                //   height:50,
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       // primary: kPink,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(18.0),
                //       ),
                //     ),
                //     onPressed: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: ((context) => ActingMain())));
                //     },
                //     child: const Text('다음', ),
                //   ),
                // )
              ],
            )
        )
    );
  }
  Widget LoadingImage(Uint8List? imageData) {
    if (imageData == null) {
      return Center(
        child: Container(
          child: Text(
            '',
          ),
        ),
      );
    } else if (imageData.length == 0) {
      return Center(
        child: Column(
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 5,
            ),
            Text('Loading'),
          ],
        ),
      );
    } else {
      return Image.memory(
        imageData,
        height: 300,
        width: 300,
      );
    }
  }
}