import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:flutter_tts/flutter_tts.dart";
import 'package:glitters/glitters.dart';
import '../../../constants.dart';

class speakingTTS extends StatefulWidget {
  var sentence;
  var imagePath;
  final FlutterTts tts = FlutterTts();

  speakingTTS(this.sentence, this.imagePath, {Key? key}):super(key: key);

  @override
  _speakingTTS createState() => new _speakingTTS(this.sentence,this.imagePath,this.tts);

// speakingTTS(this.sentence, this.imagePath) {
//   tts.setLanguage('kr');
//   tts.setSpeechRate(0.9);
//   tts.setPitch(1.2);
// }
}

class _speakingTTS extends State<speakingTTS>{
  var imagePath;
  var sentence;
  var tts;
  var selected;

  _speakingTTS(this.sentence, this.imagePath, this.tts);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Visibility(visible:selected,child: SizedBox(child: Image.asset('assets/icons/'+imagePath+'.png'),width: 230,height: 230)),
            ElevatedButton(
                onPressed: () {
                  tts.setVolume(1);
                  tts.speak(sentence);
                  setState(() {
                    selected = !selected;
                  });
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
                      size: MediaQuery.of(context).size.width / 8,
                      color: Colors.blue,
                    ),
                    // SizedBox(width: MediaQuery.of(context).size.width/15,),
                    Text(
                      sentence,
                      style: TextStyle(
                          fontFamily: 'Goyang',
                          fontSize: MediaQuery.of(context).size.width / 8,
                          color: Colors.black),
                    )
                  ],
                )),
            ElevatedButton(
                onPressed: () {
                  tts.setVolume(0.5);
                  tts.speak(sentence);
                  setState(() {
                    selected = !selected;
                  });
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
                      size: MediaQuery.of(context).size.width / 13,
                      color: Colors.blue,
                    ),
                    // SizedBox(width: MediaQuery.of(context).size.width/15,),
                    Text(
                      sentence,
                      style: TextStyle(
                          fontFamily: 'Goyang',
                          fontSize: MediaQuery.of(context).size.width / 13,
                          color: Colors.black),
                    )
                  ],
                )),
            ElevatedButton(
                onPressed: () {
                  tts.setVolume(0.3);
                  tts.speak(sentence);
                  setState(() {
                    selected = !selected;
                  });
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
                      size: MediaQuery.of(context).size.width / 15,
                      color: Colors.blue,
                    ),
                    // SizedBox(width: MediaQuery.of(context).size.width/15,),
                    Text(
                      sentence,
                      style: TextStyle(
                          fontFamily: 'Goyang',
                          fontSize: MediaQuery.of(context).size.width / 15,
                          color: Colors.black),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }

}
