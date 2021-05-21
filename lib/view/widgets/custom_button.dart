import 'package:flutter/material.dart';
import 'package:tutorial/util/color_resources.dart';
import 'package:tutorial/util/dimensions.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String btnTxt;
  final Color backgroundColor;
  CustomButton({this.onTap, @required this.btnTxt, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      height: 50,
      minWidth: MediaQuery.of(context).size.width,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: backgroundColor == null ? Theme.of(context).primaryColor : backgroundColor,
      padding: EdgeInsets.all(0),
      disabledColor: ColorResources.getGreyColor(context),
      child: Text(btnTxt??"",
          style: Theme.of(context).textTheme.headline3.copyWith(color: ColorResources.COLOR_WHITE, fontSize: Dimensions.FONT_SIZE_LARGE)),
    );
  }
}
