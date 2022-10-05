// import 'package:E_Parcel/screens/main/main_screen.dart';
import 'dart:async';

import 'package:E_Parcel/screens/main/main_screen.dart';
import 'package:E_Parcel/screens/shortSplash/short_splash.dart';
import 'package:E_Parcel/screens/splash/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import './theme.dart';
import './routes.dart';

// import './screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SplashNavigator(true);
          } else {
            return SplashNavigator(false);
          }
        },
      ),
      routes: routes,
    );
  }
}

class SplashNavigator extends StatefulWidget {
  SplashNavigator(this.isLoggedIn);
  final isLoggedIn;
  @override
  _SplashNavigatorState createState() => _SplashNavigatorState();
}

class _SplashNavigatorState extends State<SplashNavigator> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context,
            widget.isLoggedIn ? MainScreen.routeName : SplashScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return ShortSplashScreen();
  }
}
