import 'package:E_Parcel/components/default_button.dart';
import 'package:E_Parcel/constants.dart';
import 'package:E_Parcel/screens/address/enter_address_screen.dart';
import 'package:E_Parcel/screens/confirm_order/confirm_order_screen.dart';
import 'package:E_Parcel/screens/main/components/mini_components/dash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
                    margin: EdgeInsets.only(bottom: 20),
                    height: 80,
                    child: Swiper(
                      autoplay: true,
                      itemBuilder: (BuildContext context, int index) {
                        List<String> headings = [
                          "We Don't Buy",
                          "Easy Cash Payment",
                          "Max Weight"
                        ];
                        List<String> subtitle = [
                          "We don't purchase items on your behalf",
                          "Pay on pickup or drop location with ease",
                          "Take care that weight of the item should be less than 5KG"
                        ];
                        List<String> icons = [
                          "assets/icons/no-shopping.svg",
                          "assets/icons/cash.svg",
                          "assets/icons/weight.svg"
                        ];
                        return LayoutBuilder(
                          builder: (context, constraints) => Container(
                            width: constraints.maxWidth - 2,
                            decoration: BoxDecoration(
                              color: Color(0xFFF8F8F8),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: (constraints.maxWidth - 2) * 0.20,
                                  child: SvgPicture.asset(
                                    icons[index],
                                  ),
                                ),
                                Container(
                                  width: (constraints.maxWidth - 2) * 0.80,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        headings[index],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                              getProportionateScreenWidth(15),
                                        ),
                                      ),
                                      Text(
                                        subtitle[index],
                                        style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(10),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: 3,
                      viewportFraction: 0.7,
                      scale: 0.8,
                    ),
                  ),
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
                                  width: getProportionateScreenWidth(50)),
                              Center(
                                child: Dash(
                                  dashColor: Colors.grey,
                                  direction: Axis.vertical,
                                  dashLength: 6,
                                  length: 80,
                                ),
                              ),
                              Lottie.asset("assets/animations/red_locator.json",
                                  width: getProportionateScreenWidth(50)),
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
                  buildPackagingSelectionArea(context),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 30, top: 20),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              width: constraints.maxWidth * 0.50,
                              child: Text("By continuing you agree to our T&C"),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(10)),
                              width: constraints.maxWidth * 0.50,
                              child: DefaultButton(
                                textSize: 14,
                                text: "Save & Proceed",
                                press: () {
                                  Navigator.pushNamed(
                                    context,
                                    ConfirmOrderScreen.routeName,
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
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
            offset: Offset(2.0, 2.0),
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
              width: getProportionateScreenWidth(50),
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
                      fontSize: getProportionateScreenWidth(16),
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
                fontSize: getProportionateScreenWidth(16),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "1600 Amphitheatre Pkwy, Mountain View, CA 94043, United States",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: getProportionateScreenWidth(14)),
            ),
            FlatButton.icon(
                padding: EdgeInsets.only(left: -10),
                textColor: Colors.blue,
                label: Text(
                  "Add Details",
                  style: TextStyle(fontSize: getProportionateScreenWidth(14)),
                ),
                icon: Icon(
                  Icons.add_circle_outline,
                  size: getProportionateScreenWidth(20),
                ),
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
      showModalBottomSheet<dynamic>(
        isScrollControlled: true,
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
              physics: BouncingScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) {
                return PackageCategoriesList();
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

class PackageCategoriesList extends StatefulWidget {
  const PackageCategoriesList({
    Key key,
  }) : super(key: key);

  @override
  _PackageCategoriesListState createState() => _PackageCategoriesListState();
}

class _PackageCategoriesListState extends State<PackageCategoriesList> {
  List<bool> categories = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 10,
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
                      fontSize: getProportionateScreenWidth(18),
                      color: Colors.black,
                    ),
                  ),
                  Text("Select the items to send"),
                ],
              ),
              SvgPicture.asset(
                "assets/icons/delivery-list.svg",
                height: 40,
              ),
            ],
          ),
        ),
        CheckboxListTile(
          activeColor: kPrimaryColor,
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 60),
          secondary: Icon(Icons.fastfood),
          title: Text("Food"),
          value: categories[0],
          onChanged: (value) {
            setState(() {
              categories[0] = value;
            });
          },
        ),
        CheckboxListTile(
          dense: true,
          activeColor: kPrimaryColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 60),
          secondary: Icon(Icons.accessibility_new),
          title: Text("Clothes"),
          value: categories[1],
          onChanged: (value) {
            setState(() {
              categories[1] = value;
            });
          },
        ),
        CheckboxListTile(
          dense: true,
          activeColor: kPrimaryColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 60),
          secondary: Icon(Icons.business_center),
          title: Text("Documents"),
          value: categories[2],
          onChanged: (value) {
            setState(() {
              categories[2] = value;
            });
          },
        ),
        CheckboxListTile(
          dense: true,
          activeColor: kPrimaryColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 60),
          secondary: Icon(Icons.shopping_basket),
          title: Text("Groceries"),
          value: categories[3],
          onChanged: (value) {
            setState(() {
              categories[3] = value;
            });
          },
        ),
        CheckboxListTile(
          dense: true,
          activeColor: kPrimaryColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 60),
          secondary: Icon(Icons.accessible),
          title: Text("Medicines"),
          value: categories[4],
          onChanged: (value) {
            setState(() {
              categories[4] = value;
            });
          },
        ),
        CheckboxListTile(
          dense: true,
          activeColor: kPrimaryColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 60),
          secondary: Icon(Icons.laptop_mac),
          title: Text("Electronics"),
          value: categories[5],
          onChanged: (value) {
            setState(() {
              categories[5] = value;
            });
          },
        ),
        CheckboxListTile(
          dense: true,
          activeColor: kPrimaryColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 60),
          secondary: Icon(Icons.assignment),
          title: Text("Others"),
          value: categories[6],
          onChanged: (value) {
            setState(() {
              categories[6] = value;
            });
          },
        ),
        Container(
          padding:
              const EdgeInsets.only(left: 60, right: 60, top: 5, bottom: 20),
          child: DefaultButton(
            textSize: 14,
            borderRadius: 10,
            text: "Save & Continue",
            press: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
