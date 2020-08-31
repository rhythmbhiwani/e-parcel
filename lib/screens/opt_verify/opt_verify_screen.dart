import './components/body.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class OTPVerifyScreen extends StatelessWidget {
  static String routeName = "/verify-otp";
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
      title: Text(
        "E-PARCEL",
        style: TextStyle(color: kPrimaryColor),
      ),
    );
  }
}
