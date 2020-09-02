import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/body.dart';

class EnterAddressScreen extends StatelessWidget {
  static const String routeName = "/enter-address";

  @override
  Widget build(BuildContext context) {
    final type = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(
        type: type,
      ),
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
