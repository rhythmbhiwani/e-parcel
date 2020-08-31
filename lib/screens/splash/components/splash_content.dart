import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.lottijson,
  }) : super(key: key);
  final String text, lottijson;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(flex: 2),
        Container(
          child: Lottie.network(lottijson),
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(300),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
