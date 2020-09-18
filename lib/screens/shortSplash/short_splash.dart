import 'package:E_Parcel/constants.dart';
import 'package:E_Parcel/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShortSplashScreen extends StatelessWidget {
  static const String routeName = "/short-splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        alignment: Alignment.center,
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: SvgPicture.asset("assets/icons/LOGO.svg",
            width: SizeConfig.screenWidth * 0.75),
      ),
    );
  }
}
