import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/util/styles.dart';
import 'package:tutorial/view/screen/chat/chat_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () async {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => ChatScreen()));
    });

    return Scaffold(
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Welcome To City University',
              textStyle: rubikMedium.copyWith(color: Colors.deepOrange, fontSize: 20),
              speed: const Duration(milliseconds: 200),
            ),
          ],
          totalRepeatCount: 4,
          pause: const Duration(milliseconds: 2000),
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        ),
      ),
    );
  }
}
