import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:flutter_tts/flutter_tts.dart";
import '../../../constants.dart';
var selected = false;

class speakingTTS extends StatelessWidget {
  var sentence;
  var imagePath;
  final FlutterTts tts = FlutterTts();

  speakingTTS(this.sentence, this.imagePath, {Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            selected
                ? SizedBox(child: Image.asset('assets/icons/'+imagePath+'.png'),width: 100,height: 100)
                : SizedBox(child: Image.asset('assets/icons/'+imagePath+'.png'),width: 200,height: 200),
            voiceButtons(sentence, 1, 8, tts),
            voiceButtons(sentence, 0.5, 13, tts),
            voiceButtons(sentence, 0.3, 15, tts),
          ],
        ),
      ),
    );
  }

}

class voiceButtons extends StatelessWidget {
  String sentence;
  var voiceSize;
  var textSize;
  var tts;

  voiceButtons(
    this.sentence,
    this.voiceSize,
    this.textSize,
    this.tts,
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          tts.setVolume(voiceSize);
          tts.speak(sentence);
          setState(){
            selected = !selected;
          }

        },
        style: ElevatedButton.styleFrom(
          backgroundColor: kW,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.volume_up_sharp,
              size: MediaQuery.of(context).size.width / textSize,
              color: Colors.blue,
            ),
            // SizedBox(width: MediaQuery.of(context).size.width/15,),
            Text(
              sentence,
              style: TextStyle(
                  fontFamily: 'Goyang',
                  fontSize: MediaQuery.of(context).size.width / textSize,
                  color: Colors.black),
            )
          ],
        ));
  }
}
