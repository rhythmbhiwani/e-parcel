import 'package:E_Parcel/screens/splash/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import './drawer/drawer_painter.dart';
import './drawer/side_bar_button.dart';
import '../screens/main/get_widgets.dart';
import '../size_config.dart';

import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final Widget bodyContent;
  final Function buildFancyBottomNavigation;
  final bool needBottomNavbar;
  final Function changeWidget;
  Body({
    this.bodyContent,
    this.buildFancyBottomNavigation,
    this.needBottomNavbar = false,
    this.changeWidget,
  });
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Offset _offset = Offset(0, 0);
  GlobalKey globalKey = GlobalKey();
  List<double> limits = [];

  bool isMenuOpen = false;

  @override
  void initState() {
    limits = [0, 0, 0, 0, 0, 0];
    WidgetsBinding.instance.addPostFrameCallback(getPosition);
    super.initState();
  }

  getPosition(duration) async {
    RenderBox renderBox = globalKey.currentContext.findRenderObject();
    final position = renderBox.localToGlobal(Offset.zero);
    double start = position.dy - 20;
    double contLimit = position.dy + renderBox.size.height - 20;
    double step = (contLimit - start) / 5;
    limits = [];
    for (double x = start; x <= contLimit; x = x + step) {
      limits.add(x);
    }
    setState(() {
      limits = limits;
    });
  }

  double getSize(int x) {
    double size = (_offset.dy > limits[x] && _offset.dy < limits[x + 1])
        ? getProportionateScreenWidth(20)
        : getProportionateScreenWidth(18);
    return size;
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    double sidebarSize = mediaQuery.width * 0.65;
    double menuContainerHeight = mediaQuery.height / 2;

    return SafeArea(
        child: Container(
      width: mediaQuery.width,
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(100.0),
                child: AppBar(
                  flexibleSpace: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildAppBarHamburgerIcon(),
                      SvgPicture.asset(
                        logoPath,
                        width: 80,
                      ),
                      buildAppDrawerNotificationButton(context)
                    ],
                  ),
                  elevation: 0.0,
                  brightness: Brightness.light,
                ),
              ),
              body: widget.bodyContent,
              bottomNavigationBar: widget.needBottomNavbar == true
                  ? widget.buildFancyBottomNavigation()
                  : null,
            ),
            buildSideBar(sidebarSize, mediaQuery, menuContainerHeight)
          ],
        ),
      ),
    ));
  }

  GestureDetector buildAppBarHamburgerIcon() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isMenuOpen = true;
        });
      },
      child: Lottie.asset(
        'assets/animations/hamburger.json',
        fit: BoxFit.contain,
        width: getProportionateScreenWidth(120),
        height: getProportionateScreenHeight(120),
      ),
    );
  }

  GestureDetector buildAppDrawerNotificationButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "No notification!",
              style: TextStyle(fontSize: 15),
            ),
          ),
        );
      },
      child: Lottie.asset(
        'assets/animations/notification-bell_light_mode.json',
        fit: BoxFit.contain,
        width: getProportionateScreenWidth(100),
        height: getProportionateScreenHeight(70),
      ),
    );
  }

  AnimatedPositioned buildSideBar(
      double sidebarSize, Size mediaQuery, double menuContainerHeight) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 1500),
      left: isMenuOpen ? 0 : -sidebarSize,
      top: 0,
      curve: Curves.elasticOut,
      child: SizedBox(
        width: sidebarSize,
        child: GestureDetector(
          onPanUpdate: (details) {
            if (details.localPosition.dx <= sidebarSize) {
              setState(() {
                _offset = details.localPosition;
              });
            }

            if (details.localPosition.dx > sidebarSize - 20 &&
                details.delta.distanceSquared > 2) {
              setState(() {
                isMenuOpen = true;
              });
            }
          },
          onPanEnd: (details) {
            setState(() {
              _offset = Offset(0, 0);
            });
          },
          child: Stack(
            children: <Widget>[
              CustomPaint(
                size: Size(sidebarSize, mediaQuery.height),
                painter: DrawerPainter(offset: _offset),
              ),
              Container(
                height: mediaQuery.height,
                width: sidebarSize,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    buildSideBarHeader(mediaQuery, sidebarSize),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    buildSideBarContent(menuContainerHeight, mediaQuery)
                  ],
                ),
              ),
              buildSideBarBackButton(sidebarSize)
            ],
          ),
        ),
      ),
    );
  }

  Container buildSideBarHeader(Size mediaQuery, double sidebarSize) {
    return Container(
      height: mediaQuery.height * 0.25,
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: sidebarSize / 3,
              height: sidebarSize / 3,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: SvgPicture.asset(
                logoPath,
                width: sidebarSize / 2,
                colorBlendMode: BlendMode.lighten,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "OZONE PARCEL",
              style: TextStyle(
                  color: Color(0xFFECECEC),
                  fontSize: getProportionateScreenWidth(18)),
            ),
          ],
        ),
      ),
    );
  }

  Container buildSideBarContent(double menuContainerHeight, Size mediaQuery) {
    return Container(
      key: globalKey,
      width: double.infinity,
      height: menuContainerHeight,
      child: Column(
        children: <Widget>[
          SideBarButton(
            text: "Home",
            iconData: Icons.home,
            textSize: getSize(0),
            height: (menuContainerHeight) / 5,
            onPressed: () {
              isMenuOpen = false;
              widget.changeWidget(GetWidgets.dashboardWidget(), true);
            },
          ),
          SideBarButton(
            text: "Settings",
            iconData: Icons.settings,
            textSize: getSize(1),
            height: (menuContainerHeight) / 5,
            onPressed: () {
              isMenuOpen = false;
              widget.changeWidget(GetWidgets.settingsWidget(), false);
            },
          ),
          SideBarButton(
            text: "About",
            iconData: Icons.info,
            textSize: getSize(2),
            height: (mediaQuery.height / 2) / 5,
            onPressed: () {
              isMenuOpen = false;
              widget.changeWidget(GetWidgets.aboutWidget(), false);
            },
          ),
          SideBarButton(
            text: "Help & Feedback",
            iconData: Icons.announcement,
            textSize: getSize(3),
            height: (menuContainerHeight) / 5,
            onPressed: () {
              isMenuOpen = false;
              widget.changeWidget(GetWidgets.helpWidget(), false);
            },
          ),
          SideBarButton(
            text: "Logout",
            iconData: Icons.exit_to_app,
            textSize: getSize(4),
            height: (menuContainerHeight) / 5,
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, SplashScreen.routeName, (route) => false);
            },
          ),
        ],
      ),
    );
  }

  AnimatedPositioned buildSideBarBackButton(double sidebarSize) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 400),
      right: (isMenuOpen) ? 10 : sidebarSize,
      bottom: 30,
      child: IconButton(
        enableFeedback: true,
        icon: Icon(
          Icons.keyboard_backspace,
          color: Color(0xFFECECEC),
          size: 30,
        ),
        onPressed: () {
          this.setState(() {
            isMenuOpen = false;
          });
        },
      ),
    );
  }
}
