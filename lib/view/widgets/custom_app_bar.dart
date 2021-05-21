import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial/provider/localization_provider.dart';
import 'package:tutorial/util/app_constant.dart';
import 'package:tutorial/util/color_resources.dart';
import 'package:tutorial/util/dimensions.dart';
import 'package:tutorial/util/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButtonExist;
  final Function onBackPressed;
  final double appBarSize;
  final bool isHomeScreen;
  final bool isProdctScreen;

  CustomAppBar(
      {@required this.title,
      this.isBackButtonExist = true,
      this.onBackPressed,
      this.appBarSize = 50,
      this.isHomeScreen = false,
      this.isProdctScreen = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: Theme.of(context).textTheme.bodyText1.color)),
      //centerTitle: true,
      leading: isBackButtonExist
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Theme.of(context).textTheme.bodyText1.color,
              onPressed: () => onBackPressed != null ? onBackPressed() : Navigator.pop(context),
            )
          : SizedBox(),
      backgroundColor: Theme.of(context).accentColor,
      elevation: 0,
      actions: [
        isHomeScreen
            ? IconButton(
                icon: Icon(Icons.language, color: ColorResources.getPrimaryColor(context)),
                onPressed: () {
                  Provider.of<LocalizationProvider>(context, listen: false).locale.countryCode == 'US'
                      ? Provider.of<LocalizationProvider>(context, listen: false).setLanguage(Locale(
                          AppConstant.languages[1].languageCode,
                          AppConstant.languages[1].countryCode,
                        ))
                      : Provider.of<LocalizationProvider>(context, listen: false).setLanguage(Locale(
                          AppConstant.languages[0].languageCode,
                          AppConstant.languages[0].countryCode,
                        ));
                })
            : SizedBox.shrink(),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, appBarSize);
}
