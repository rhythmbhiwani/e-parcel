import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

import './components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EPARCEL"),
        centerTitle: true,
      ),
      body: Body(),
      bottomNavigationBar: buildFancyBottomNavigation(),
    );
  }

  FancyBottomNavigation buildFancyBottomNavigation() {
    return FancyBottomNavigation(
      tabs: [
        TabData(iconData: Icons.home, title: "Overview"),
        TabData(iconData: Icons.add_circle, title: "Book"),
        TabData(iconData: Icons.history, title: "History")
      ],
      onTabChangedListener: (position) {
        print(position);
      },
    );
  }
}
