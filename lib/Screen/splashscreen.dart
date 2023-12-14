import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../view/LogigScreen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    super.initState();

    UserCheck();
    // splashScreen.isLogin();
  }
  UserCheck(){
    Timer(Duration(seconds: 3), () {Get.off(LoginScreen()); });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        height: MediaQuery.of(context).size.height*1,
        width: MediaQuery.of(context).size.width*1,
        decoration: const BoxDecoration(
          color: Color(0xff38AB51),
            image: DecorationImage(
                image: AssetImage("assets/aapIcon/splashScreendistro.png"), fit: BoxFit.cover)),
      ),
    );
  }
}
