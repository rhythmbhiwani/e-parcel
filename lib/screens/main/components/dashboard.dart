import '../../../size_config.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.screenHeight - 190,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
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
            Form(
                child: Column(
              children: [],
            )),
            Center(
              child: Text("Dashboard Content Will Come Here"),
            )
          ],
        ),
      ),
    );
  }
}
