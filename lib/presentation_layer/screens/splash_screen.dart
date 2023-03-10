import 'dart:async';

import 'package:bb/constants/colors.dart';
import 'package:bb/constants/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  void _startDelay() {
    _timer = Timer(const Duration(seconds: 1), goNext);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myYellow,
      body: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset('assets/images/icon.png'
            ,fit: BoxFit.fitHeight,))),
    );
  }

  void goNext() {
    Navigator.pushReplacementNamed(context, allCharactersRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
