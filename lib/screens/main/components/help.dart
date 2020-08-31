import '../../../size_config.dart';
import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.screenHeight - 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(40)),
            child: Text(
              "HELP & FEEDBACK",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(32),
                fontFamily: "Muli",
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 100),
          Center(
            child: Text("Feedback Content Will Come Here"),
          )
        ],
      ),
    );
  }
}
