import 'package:KDT_SENTIMENTO/screen/Splash/splashScreen.dart';
import 'package:KDT_SENTIMENTO/screen/AAC/aacCategory_fb.dart';
import 'package:KDT_SENTIMENTO/screen/home/component/appbar.dart';
import 'package:KDT_SENTIMENTO/screen/home/component/drawer.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'AAC/aacCategory.dart'; //////////////////////////////////////////////////
import 'home/home.dart';
import 'Setting/setting.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/mainScreens";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List pages = [Home(), AacCategory(), Setting()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MainDrawer(),
        appBar: MainAppBar(appBar: AppBar()),
        body: pages[selectedIndex],
        bottomNavigationBar: SizedBox(
          height: 75,
          child: BottomNavigationBar(
            elevation: 10,
            backgroundColor: Color.fromRGBO(245, 249, 255, 1),
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.black26,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: selectedIndex,
            selectedItemColor: Colors.blueGrey,
            onTap: (i) {
              setState(() {
                selectedIndex = i;
                print(i);
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.edit),
                label: "홈",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.question_answer_rounded),
                  label: "AAC"),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "설정",
              ),
            ],
          ),
        ));
  }
}
