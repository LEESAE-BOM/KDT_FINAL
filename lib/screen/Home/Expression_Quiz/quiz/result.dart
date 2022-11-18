import 'package:KDT_SENTIMENTO/screen/Home/home.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';
import '../../../../theme.dart';
import 'package:flutter/cupertino.dart';
import '../../home.dart';

class Result extends StatelessWidget {
  final int resultScore;

  String get resultPhrase {
    var resultText = 'You did it !';
    if (resultScore < 20) {
      resultText = '다시 시도해보세요!';
    } else {
      resultText = '잘했어요!';
    }
    return resultText;
  }

  Result(this.resultScore);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(
            child:
            Column(
              children: [
                SizedBox(
                  height: 180,
                ),
                Text(
                  resultPhrase,
                  style: textTheme().headline1?.copyWith(
                      color: kSecondaryColor,fontSize: 40,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton.icon(
                  icon: Icon(
                    CupertinoIcons.back,
                    size: 30,
                  ),
                  onPressed: (){
                    int count = 0;
                    Navigator.of(context).popUntil((_) => count++ >= 4);
                  },
                  label: Text('돌아가기'),
                  style: ElevatedButton.styleFrom(primary: Colors.blueAccent),

                )
              ],
            )
        )
    );
  }
}