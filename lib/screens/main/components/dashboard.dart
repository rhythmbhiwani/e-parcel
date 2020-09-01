import '../../../size_config.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
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
            "DASHBOARD",
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
              Center(
                child: Text("ABOUT"),
              ),
            ],
          ),
        )
      ],
    );
  }
}
