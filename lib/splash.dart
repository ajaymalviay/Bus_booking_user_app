
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quick_pay/Auth/Login/UI/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Auth/Login/UI/login_ui.dart';
import '../Auth/login_navigator.dart';
import '../BottomNavigation/Home/home.dart';
import 'BottomNavigation/bottom_navigation.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    // Timer(Duration(seconds: 3), () {
    //   // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInScreen()));}
    // );
    super.initState();

    Future.delayed( Duration(milliseconds:2),() async{
      SharedPreferences prefs  = await SharedPreferences.getInstance();
      String? id  =  prefs.getString('id');
      if(id == null || id == "") {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BottomBar()));
      }

      // checkFirstSeen();

      // if(uid == null || uid == ""){
      //   // return SeekerDrawerScreen();
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      // }
      // else{
      //   if(type == "seeker") {
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (context) => RecruiterDashboard()));
      //   }
      //   else{
      //     /// jsut for ddummy data RecruiterDashboard data is use
      //   }
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (context) => RecruiterDashboard()));
      //   }
      //return SignInScreen();
    });

    // Future.delayed(Duration(milliseconds: 300),(){
    //   return checkLogin();
    // });
    // Future.delayed(Duration(seconds: 2),(){
    //   print("Conditions   ${id == null || id == ""}");
    //   if(id == null || id == ""){
    //     print("this is is user is${id}");
    //     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginUI()));
    //   }
    //   else{
    //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0.8),
          body:  Center(
            child: Container(
                decoration: BoxDecoration(
                    image:DecorationImage(
                        image:AssetImage('assets/loginlogo.png'),
                        fit: BoxFit.fill
                    )
                )
            ),
          ),
        ),
      );
  }
}
