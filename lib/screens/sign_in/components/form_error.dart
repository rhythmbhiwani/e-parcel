import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../size_config.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key key,
    @required this.error,
  }) : super(key: key);

  final List<String> error;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        error.length,
        (index) => Padding(
          padding: const EdgeInsets.only(left: 10),
          child: formErrorText(error: error[index]),
        ),
      ),
    );
  }

  Row formErrorText({String error}) {
    return Row(
      children: [
        Lottie.asset(
          "assets/animations/error.json",
          height: getProportionateScreenHeight(30),
          width: getProportionateScreenWidth(30),
        ),
        SizedBox(width: getProportionateScreenWidth(10)),
        Text(error),
      ],
    );
  }
}
