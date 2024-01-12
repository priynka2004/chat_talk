import 'dart:developer';
import 'package:chat_talk/chat_talk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.white,
            statusBarColor: Colors.white));

        if (APIs.auth.currentUser != null) {
          log('\nUser: ${APIs.auth.currentUser}');

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HomeScreen()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const LoginScreen()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: mq.height * .15,
          right: mq.width * .25,
          width: mq.width * .5,
          child: Image.asset('assets/images/communication.png'),
        ),
        Positioned(
          bottom: mq.height * .15,
          width: mq.width,
          child: const Text(
            'MADE IN INDIA WITH ❤️',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, color: Colors.black87, letterSpacing: .5),
          ),
        ),
      ]),
    );
  }
}
