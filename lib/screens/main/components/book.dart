import 'package:E_Parcel/components/default_button.dart';
import 'package:E_Parcel/screens/address/enter_address_screen.dart';
import 'package:E_Parcel/screens/main/components/mini_components/dash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../../size_config.dart';
import 'package:flutter/material.dart';

class Book extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 75,
          width: double.infinity,
          padding: EdgeInsets.only(left: getProportionateScreenWidth(40)),
          child: Text(
            "BOOK PICKUP",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(32),
              fontFamily: "Muli",
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1.0,
                          spreadRadius: 0.0,
                          offset: Offset(
                              2.0, 2.0), // shadow direction: bottom right
                        )
                      ],
                    ),
                    height: 210,
                    child: Row(
                      children: [
                        Container(
                          width: SizeConfig.screenWidth * 0.20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Lottie.asset(
                                  "assets/animations/green_locator.json",
                                  height: 70),
                              Center(
                                child: Dash(
                                  dashColor: Colors.grey,
                                  direction: Axis.vertical,
                                  dashLength: 6,
                                  length: 80,
                                ),
                              ),
                              Lottie.asset("assets/animations/red_locator.json",
                                  height: 60),
                            ],
                          ),
                        ),
                        Container(
                          width: SizeConfig.screenWidth * 0.80,
                          child: Column(
                            children: [
                              buildAddAddressArea(
                                  add: () {
                                    Navigator.pushNamed(
                                      context,
                                      EnterAddressScreen.routeName,
                                      arguments: "pickup",
                                    );
                                  },
                                  heading: "PICKUP"),
                              Container(
                                height: 10,
                                padding: const EdgeInsets.only(left: 10),
                                alignment: Alignment.centerLeft,
                                child: Dash(
                                  dashColor: Colors.grey,
                                  direction: Axis.horizontal,
                                  dashLength: 6,
                                  length: 250,
                                ),
                              ),
                              buildAddAddressArea(
                                  add: () {
                                    Navigator.pushNamed(
                                      context,
                                      EnterAddressScreen.routeName,
                                      arguments: "drop",
                                    );
                                  },
                                  heading: "DROP"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  buildPackagingSelectionArea(context)
                ],
              );
            },
          ),
        )
      ],
    );
  }

  Container buildPackagingSelectionArea(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0), // shadow direction: bottom right
          )
        ],
      ),
      height: 100,
      child: Row(
        children: [
          Container(
            width: SizeConfig.screenWidth * 0.20,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/icons/packaging.svg",
              height: 70,
            ),
          ),
          Container(
            width: SizeConfig.screenWidth * 0.80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "PACKAGE TYPE",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: Colors.transparent,
                    ),
                    child: PackageTypeSelector()),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildAddAddressArea({String heading, Function add}) {
    return Container(
      height: 100,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "1600 Amphitheatre Pkwy, Mountain View, CA 94043, United States",
              overflow: TextOverflow.ellipsis,
            ),
            FlatButton.icon(
                padding: EdgeInsets.only(left: -10),
                textColor: Colors.blue,
                label: Text("Add Details"),
                icon: Icon(Icons.add_circle_outline),
                onPressed: add)
          ],
        ),
      ),
    );
  }
}

class PackageTypeSelector extends StatelessWidget {
  const PackageTypeSelector({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _showModalBottomSheet(context) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            height: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(100),
              ),
            ),
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Select Category",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(20),
                                  color: Colors.black,
                                ),
                              ),
                              Text("Select the items to send"),
                            ],
                          ),
                          SvgPicture.asset(
                            "assets/icons/delivery-list.svg",
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 60),
                      secondary: Icon(Icons.fastfood),
                      title: Text("Food"),
                      value: false,
                      onChanged: null,
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 60),
                      secondary: Icon(Icons.accessibility_new),
                      title: Text("Clothes"),
                      value: true,
                      onChanged: null,
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 60),
                      secondary: Icon(Icons.business_center),
                      title: Text("Documents"),
                      value: false,
                      onChanged: null,
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 60),
                      secondary: Icon(Icons.shopping_basket),
                      title: Text("Groceries"),
                      value: true,
                      onChanged: null,
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 60),
                      secondary: Icon(Icons.accessible),
                      title: Text("Medicines"),
                      value: false,
                      onChanged: null,
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 60),
                      secondary: Icon(Icons.laptop_mac),
                      title: Text("Electronics"),
                      value: true,
                      onChanged: null,
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 60),
                      secondary: Icon(Icons.assignment),
                      title: Text("Others"),
                      value: false,
                      onChanged: null,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 20),
                      child: DefaultButton(
                        text: "Save & Continue",
                        press: () {},
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      );
    }

    return FlatButton(
        onPressed: () {
          _showModalBottomSheet(context);
        },
        child: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.black12,
                width: 3.0,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text("Select Category"),
                flex: 5,
              ),
              Expanded(
                flex: 1,
                child: Icon(Icons.arrow_drop_down_circle),
              ),
            ],
          ),
        ));
  }
}
