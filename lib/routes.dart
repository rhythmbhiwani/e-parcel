import './screens/main/main_screen.dart';
import './screens/opt_verify/opt_verify_screen.dart';
import './screens/sign_in/sign_in_screen.dart';
import './screens/splash/splash_screen.dart';

import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  OTPVerifyScreen.routeName: (context) => OTPVerifyScreen(),
  MainScreen.routeName: (context) => MainScreen(),
};
