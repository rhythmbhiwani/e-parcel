import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:E_Parcel/constants.dart';
import 'package:flutter/rendering.dart';

import '../../../size_config.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 75,
          width: double.infinity,
          padding: EdgeInsets.only(left: getProportionateScreenWidth(40)),
          child: Text(
            "SETTINGS",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(32),
              fontFamily: "Muli",
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              buildSettingOption("Dark Mode"),
              SizedBox(height: 10),
              buildSettingOption("Push Notifications"),
            ],
          ),
        )
      ],
    );
  }

  Widget buildSettingOption(String text) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(40)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: getProportionateScreenWidth(22)),
          ),
          Padding(
            padding: EdgeInsets.only(right: getProportionateScreenWidth(40)),
            child: SettingsSwitch(),
          ),
        ],
      ),
    );
  }
}

class SettingsSwitch extends StatefulWidget {
  const SettingsSwitch({
    Key key,
  }) : super(key: key);

  @override
  _SettingsSwitchState createState() => _SettingsSwitchState();
}

class _SettingsSwitchState extends State<SettingsSwitch> {
  bool trueOrFalse = false;
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
        trackColor: Colors.black26,
        activeColor: kPrimaryColor,
        value: trueOrFalse,
        onChanged: (value) {
          setState(() {
            trueOrFalse = value;
          });
        });
  }
}
