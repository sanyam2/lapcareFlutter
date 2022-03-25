import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lapcare/pages/homePage.dart';
import 'package:lapcare/pages/welcomePage.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

String finalEmail = '';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    getValidationData().whenComplete(() {
      Timer(
          Duration(seconds: 2),
          () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      finalEmail.isEmpty ? welcomePage() : homePage()),
              (route) => false));
    });

    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: 300.0,
          width: 300.0,
          child: Lottie.asset("animation/hello.json"),
        ),
      ),
    );
  }
}
