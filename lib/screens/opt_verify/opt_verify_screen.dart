import 'package:flutter_svg/flutter_svg.dart';

import './components/body.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class OTPVerifyScreen extends StatelessWidget {
  static const String routeName = "/verify-otp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: kPrimaryColor),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: SvgPicture.asset(
        logoPath,
        width: 80,
      ),
    );
  }
}
