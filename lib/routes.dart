import 'package:E_Parcel/screens/address/enter_address_screen.dart';
import 'package:E_Parcel/screens/confirm_order/confirm_order_screen.dart';

import './screens/main/main_screen.dart';
import './screens/opt_verify/opt_verify_screen.dart';
import './screens/sign_in/sign_in_screen.dart';
import './screens/splash/splash_screen.dart';

import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (_) => SplashScreen(),
  SignInScreen.routeName: (_) => SignInScreen(),
  OTPVerifyScreen.routeName: (_) => OTPVerifyScreen(),
  MainScreen.routeName: (_) => MainScreen(),
  EnterAddressScreen.routeName: (_) => EnterAddressScreen(),
  ConfirmOrderScreen.routeName: (_) => ConfirmOrderScreen(),
};
