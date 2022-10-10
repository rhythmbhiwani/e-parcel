import '../../components/body.dart';
import '../../size_config.dart';
import 'get_widgets.dart';

import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "/main";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool needBottomNavbar = true;
  Widget widgetHolder;
  void initState() {
    widgetHolder = GetWidgets.dashboardWidget();
    super.initState();
  }

  void changeWidget(Widget newWidget, bool bottomNavBar) {
    setState(() {
      needBottomNavbar = bottomNavBar;
      widgetHolder = newWidget;
    });
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
      initialSelection: 1,
      tabs: [
        TabData(iconData: Icons.dashboard, title: "Dashboard"),
        TabData(
            iconData: Icons.add_circle,
            title: "Book",
            onclick: () => changeWidget(GetWidgets.bookWidget(), true)),
        TabData(iconData: Icons.history, title: "History")
      ],
      onTabChangedListener: (position) {
        if (position == 0) {
          changeWidget(GetWidgets.dashboardWidget(), true);
        } else if (position == 1) {
          changeWidget(GetWidgets.bookWidget(), true);
        } else if (position == 2) {
          changeWidget(GetWidgets.historyWidget(), true);
        }
      },
    );
  }
}
