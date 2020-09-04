// import 'package:E_Parcel/screens/main/main_screen.dart';
import 'dart:async';

import 'package:E_Parcel/screens/shortSplash/short_splash.dart';
import 'package:E_Parcel/screens/splash/splash_screen.dart';

import './theme.dart';
import './routes.dart';

// import './screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Parcel',
      theme: theme(),
      home: SplashNavigator(),
      routes: routes,
    );
  }
}

class SplashNavigator extends StatefulWidget {
  @override
  _SplashNavigatorState createState() => _SplashNavigatorState();
}

class _SplashNavigatorState extends State<SplashNavigator> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, SplashScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return ShortSplashScreen();
  }
}
