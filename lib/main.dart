import 'package:flutter/material.dart';
import 'theme.dart';
import 'screen/Splash/splashScreen.dart';
import 'route.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //date format전에 확인
  await initializeDateFormatting();
  runApp(
      Sentimento());
}
class Sentimento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sentimento",
      initialRoute: SplashScreen.routeName,
      routes: route,
      theme: theme(),
    );
  }
}