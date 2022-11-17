import 'package:KDT_SENTIMENTO/constants.dart';
import 'package:KDT_SENTIMENTO/screen/Home/Speaking/speaking_TTS.dart';
import 'package:KDT_SENTIMENTO/screen/Home/Speaking/speaking_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../Feeling_Cards/feeling_card.dart';

class speakingMenu extends StatelessWidget {
  const speakingMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Buttons('안녕하세요','hi'),
                  Buttons('감사합니다','thankyou'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Buttons('미안합니다','sorry'),
                  Buttons('반갑습니다','nicetomeetyou'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kW,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 1.8,
                    minimumSize: Size(350,30)
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => Input())));
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(child: Image.asset('assets/icons/custom.png'),width: 50,height: 50),
                      ),
                      Text.rich(
                        TextSpan(
                          text: '나만의 문장',
                          style: textTheme().headline1?.copyWith(
                              color: kSecondaryColor,
                              fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ]
        )
      )
    );
  }
}

class Buttons extends StatelessWidget {
  Buttons(this.category, this.imagePath, {Key? key}) : super(key: key);
  String category;
  String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: kW,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            elevation: 1.8
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => speakingTTS(category, imagePath))));
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(child: Image.asset('assets/icons/'+imagePath+'.png'),width: 60,height: 60),
              ),
              Text.rich(
                TextSpan(
                  text: category,
                  style: textTheme().headline1?.copyWith(
                      color: kSecondaryColor,
                      fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
