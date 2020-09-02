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
                  buildPackagingSelectionArea()
                ],
              );
            },
          ),
        )
      ],
    );
  }

  Container buildPackagingSelectionArea() {
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "PACKAGE TYPE",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DropdownButton(
                    isExpanded: true,
                    items: [
                      DropdownMenuItem(child: Text("Food")),
                      DropdownMenuItem(child: Text("Medicians")),
                      DropdownMenuItem(child: Text("Groceries")),
                      DropdownMenuItem(child: Text("Documents")),
                      DropdownMenuItem(child: Text("Electronics")),
                      DropdownMenuItem(child: Text("Cloths")),
                      DropdownMenuItem(child: Text("Other")),
                    ],
                    onChanged: (value) {},
                  ),
                ],
              ),
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
