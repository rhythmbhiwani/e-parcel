import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

import '../../components/body.dart';

import '../../size_config.dart';
import 'package:flutter/material.dart';
import 'package:condition/condition.dart';

enum AllScreens {
  about,
  dashboard,
  book,
  history,
  help,
}

class HomeScreen extends StatefulWidget {
  static const String routeName = "/main";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool needBottomNavbar = true;
  Widget widgetHolder;
  void initState() {
    widgetHolder = dashboardWidget();
    super.initState();
  }

  void changeWidget(Widget newWidget, bool bottomNavBar) {
    setState(() {
      needBottomNavbar = bottomNavBar;
      widgetHolder = newWidget;
    });
  }

  Widget dashboardWidget() {
    return Container(
      color: Colors.white,
      child: Center(
        child: FlatButton(
          color: Colors.blue,
          textColor: Colors.white,
          padding: EdgeInsets.all(8.0),
          splashColor: Colors.blueAccent,
          onPressed: () {
            setState(() {
              widgetHolder = secondWidget();
            });
          },
          child: Text(
            "Dashboard Widget",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  Widget secondWidget() {
    return Container(
      color: Colors.grey,
      child: Center(
        child: FlatButton(
          color: Colors.blue,
          textColor: Colors.white,
          padding: EdgeInsets.all(8.0),
          splashColor: Colors.blueAccent,
          onPressed: () {
            changeWidget(dashboardWidget(), true);
          },
          child: Text(
            "Second Widget",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(
        changeWidget: changeWidget,
        bodyContent: widgetHolder,
        buildFancyBottomNavigation: buildFancyBottomNavigation,
        needBottomNavbar: needBottomNavbar,
      ),
    );
  }

  FancyBottomNavigation buildFancyBottomNavigation() {
    return FancyBottomNavigation(
      inactiveIconColor: Colors.grey,
      tabs: [
        TabData(iconData: Icons.dashboard, title: "Dashboard"),
        TabData(iconData: Icons.add_circle, title: "Book"),
        TabData(iconData: Icons.history, title: "History")
      ],
      onTabChangedListener: (position) {
        if (position == 0) {
          changeWidget(
              Container(
                decoration: BoxDecoration(color: Colors.red),
              ),
              true);
        } else if (position == 1) {
          changeWidget(
              Container(
                decoration: BoxDecoration(color: Colors.blue),
              ),
              true);
        } else if (position == 2) {
          changeWidget(
              Container(
                decoration: BoxDecoration(color: Colors.yellow),
              ),
              true);
        }
      },
    );
  }
}
