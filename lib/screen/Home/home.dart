import 'package:KDT_SENTIMENTO/screen/Home/Expression_Quiz/level.dart';
import 'package:KDT_SENTIMENTO/screen/Home/Expression_Quiz/quiz_easy.dart';
import 'package:KDT_SENTIMENTO/screen/Home/Expression_Quiz/quiz_hard.dart';
import 'package:KDT_SENTIMENTO/screen/Home/Expression_Quiz/quiz_mid.dart';
import 'package:KDT_SENTIMENTO/screen/Home/Feeling_Cards/feeling_card.dart';
import 'package:KDT_SENTIMENTO/screen/Home/Speaking/speaking_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../theme.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeButtons()
    );
  }
}
class HomeButtons extends StatelessWidget {
  const HomeButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackColor,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                    left:35,top:20
                  ),
                  child: Text.rich(
                  TextSpan(
                  text: '오늘의 학습',
                  style: textTheme().headline1?.copyWith(
                  color: kTextColor,
                  fontFamily: 'Jalnan',
                  fontSize: 23),
                  )
                  )
                ),
              Row(
                children: const [
                  Expanded(child: Padding(
                    padding: EdgeInsets.only(left:20.0, right:15.0),
                    child: Quiz(),
                  )),
                  Expanded(child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Cards(),
                  )),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                    ),
                child: Speak(),
              ),
            ],
          ),
      ),
    );
  }
}

class Quiz extends StatelessWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
                color:Colors.white10,
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0,3)
            )
          ]
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kW,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          // elevation: 1.8,
          // shadowColor: Colors.black38,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => Expression_quiz())));
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(child: Image.asset('assets/image/face.png'),width: 50,height: 50),
              ),
              Text.rich(
                TextSpan(
                  text: '표정 퀴즈',
                  style: textTheme().headline1?.copyWith(
                      color: kSecondaryColor,
                      fontSize: 20),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
                color:Colors.white10,
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0,3)
            )
          ]
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kW,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          // elevation: 1.8,
          // shadowColor: Colors.black12,
        ),
        onPressed: () {
          Navigator.push(context,
               MaterialPageRoute(builder: ((context) => EmotionCardScreen())));
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(child: Image.asset('assets/image/book.png'),width: 50,height: 50),
              ),
              Text.rich(
                TextSpan(
                  text: '감정 카드',
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

class Speak extends StatelessWidget {
  const Speak({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
              color:Colors.white10,
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0,3)
          )
        ]
        ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kW,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          // elevation: 1.8,
          // shadowColor: Colors.black12,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => speakingMenu())));
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(child: Image.asset('assets/image/microphone.png'),width: 50,height: 50),
              ),
              Text.rich(
               TextSpan(
                text: '목소리 크기 학습',
                style: textTheme().headline1?.copyWith(
                  color: kSecondaryColor,
                  fontFamily: 'Nanum',
                  fontSize: 20),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}