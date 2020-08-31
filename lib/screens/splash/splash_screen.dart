import '../../size_config.dart';

import '../../screens/splash/components/body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        child: Body(),
        height: SizeConfig.screenHeight,
      )),
    );
  }
}
