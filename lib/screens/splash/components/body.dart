import '../../../screens/sign_in/sign_in_screen.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

import '../components/splash_content.dart';

import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "JUST FILL THE FORM",
      "lottie":
          "https://firebasestorage.googleapis.com/v0/b/delivery-demo-db26c.appspot.com/o/delivery_1.json?alt=media&token=819f5e70-9929-4a79-aa9b-462d3fcdad1b",
    },
    {
      "text": "WE PICKUP THE PACKAGE",
      "lottie":
          "https://firebasestorage.googleapis.com/v0/b/delivery-demo-db26c.appspot.com/o/delivery_2.json?alt=media&token=07110c42-7b65-4549-8c2e-7611c776d7bf",
    },
    {
      "text": "AND DELIVER IT SAFELY",
      "lottie":
          "https://firebasestorage.googleapis.com/v0/b/delivery-demo-db26c.appspot.com/o/delivery_3.json?alt=media&token=9dd778db-d0ac-4406-a2a5-29d4fd51505f",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Spacer(),
            Hero(
              tag: "app_name",
              child: Text(
                "E-PARCEL",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(36),
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "Indian Local Transport Service",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (ctx, index) => SplashContent(
                  text: splashData[index]["text"],
                  lottijson: splashData[index]["lottie"],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                ),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    Hero(
                      tag: "start_btn",
                      child: DefaultButton(
                        text: "Continue",
                        press: () {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        },
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
