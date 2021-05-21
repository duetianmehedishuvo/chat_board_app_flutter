import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tutorial/localization/language_constrants.dart';
import 'package:tutorial/view/screen/chat/chat_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1), () async {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => ChatScreen()));
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(getTranslated('splash_screen', context), style: Theme.of(context).textTheme.headline2),
          ],
        ),
      ),
    );
  }
}
