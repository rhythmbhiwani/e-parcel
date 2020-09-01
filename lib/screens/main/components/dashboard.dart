import '../../../size_config.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 65,
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
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child:
                        Image.asset("assets/animations/ready_for_service.gif"),
                  ),
                  Text(
                    "We are ready at your service",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: getProportionateScreenWidth(20)),
                  ),
                  Text(
                    "Click + to start booking with us",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
