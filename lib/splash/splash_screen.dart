
import 'dart:async';

import 'package:flutter/material.dart';

import '../Auth/Login/UI/login_ui.dart';
import '../Auth/login_navigator.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(milliseconds: 500), () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  LoginNavigator(),));});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image:DecorationImage(
                    image:AssetImage('assets/imgs/splash screen.png'),
                    fit: BoxFit.fill
                )
            )
        ),
      ),
    );
  }
}
