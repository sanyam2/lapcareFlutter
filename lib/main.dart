import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lapcare/pages/splash.dart';
import 'package:lapcare/pages/welcomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: splash(),
    );
  }
}
