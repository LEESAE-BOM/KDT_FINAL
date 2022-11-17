import 'package:KDT_SENTIMENTO/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text('공지사항',
                    style: TextStyle(
                      fontFamily: 'Jalnan',
                      fontSize: 30,
                      color: kTextColor,
                    )),
              ),
              ExpansionTile(
                title: const Text(
                  '새로운 버전이 업데이트 되었어요!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: kTextColor,
                      fontFamily: 'Nanum'),
                ),
                initiallyExpanded: false,
                backgroundColor: Colors.white,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        '센티멘토가 유저분들의 의견을 반영하여 사용성을 개선했어요. 앱의 원활한 이용을 위해 최신버전으로 업데이트 해주세요.',
                        style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: 18,
                            fontFamily: 'Nanum'),
                      ),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                  title: const Text(
                    '센티멘토의 웹사이트를 이용해보세요!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: kTextColor,
                        fontFamily: 'Nanum'),
                  ),
                  initiallyExpanded: false,
                  backgroundColor: Colors.white,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          '센티멘토의 웹사이트 https://sentimento.com에 접속해 더 많은 학습자료와 커뮤니티 기능을 사용해보세요.',
                          style: TextStyle(
                              color: kSecondaryColor,
                              fontSize: 18,
                              fontFamily: 'Nanum'),
                        ),
                      ),
                    ),
                  ]),
              ExpansionTile(
                  title: const Text(
                    '센티멘토의 학습 인증 이벤트 진행!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: kTextColor,
                        fontFamily: 'Nanum'),
                  ),
                  initiallyExpanded: false,
                  backgroundColor: Colors.white,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          '매일 매일 학습 인증을 남겨보세요! 센티멘토가 추첨을 통해 다양한 경품을 드립니다.',
                          style: TextStyle(
                              color: kSecondaryColor,
                              fontSize: 18,
                              fontFamily: 'Nanum'),
                        ),
                      ),
                    ),
                  ]),
            ])));
  }
}
