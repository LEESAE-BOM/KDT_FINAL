import 'dart:ui';

import 'package:KDT_SENTIMENTO/screen/Home/Speaking/speaking_TTS.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import "package:flutter_tts/flutter_tts.dart";

void main() {
  runApp(Input());
}

class Input extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: speakingInput(),
    );
  }
}

class speakingInput extends StatelessWidget {
  final mycontroller = TextEditingController();
  late String input_text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('나만의 문장으로 공부해요!',
              style: TextStyle(
                fontFamily: 'Jalnan',
                fontSize: 25,
                color:kTextColor
              )),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: '원하는 문장을 입력하세요.',
                  ),
                  onChanged: (value) {
                    input_text = value;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                builder: (context) => speakingTTS(input_text,'custom')));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlueAccent,
              ),
                child: const Text(
                '다음',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Nanum',
                ),
              )),
        ]));
  }
}
