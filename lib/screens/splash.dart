import 'package:ebnsina/screens/login.dart';
import 'package:flutter/material.dart';

import '../utils/images.dart';
import '../utils/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 6), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => LoginScreen(),
        ),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            Images.appLogo,

            //  height: 130,
          ),
          // SizedBox(height: 30),
          // Text(
          //   Images.APP_NAME,
          //   textAlign: TextAlign.center,
          //   style: poppinsMedium.copyWith(
          //     color: Theme.of(context).primaryColor,
          //     fontSize: 50,
          //   ),
          // ),
        ],
      ),
    );
  }
}
