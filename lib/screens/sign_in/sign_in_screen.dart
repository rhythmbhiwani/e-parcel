import '../../constants.dart';
import './components/body.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = "/sign_in";
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
      title: Hero(
        tag: "app_name",
        child: Text(
          "E-PARCEL",
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
    );
  }
}
