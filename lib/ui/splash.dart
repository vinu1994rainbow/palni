import 'package:flutter/material.dart';
import 'package:interview_new/ui/dashboard/homescreen.dart';

import '../dropdown_screen.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String accesstoken = "";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () => getSharedPreferenceData());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Image.asset("assets/app_logo.jpg"),
      ),
    ));
  }

  void getSharedPreferenceData() async{

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  HomeScreen()));

  }
}