import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial/provider/theme_provider.dart';

class ColorResources {
  static Color getPrimaryColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFFba4f41) : Color(0xFFFC6A57);
  }

  static Color getGreyColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFF6f7275) : Color(0xFFA0A4A8);
  }

  static const Color COLOR_PRIMARY = Color(0xFFFC6A57);
  static const Color COLOR_GREY = Color(0xFFA0A4A8);
  static const Color COLOR_WHITE = Color(0xFFFFFFFF);
  static const Color COLOR_GREY_BUNKER = Color(0xff25282B);
  static const Color COLOR_GREY_CHATEAU = Color(0xffA0A4A8);
}
