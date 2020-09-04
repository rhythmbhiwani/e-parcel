import 'package:E_Parcel/constants.dart';
import 'package:E_Parcel/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stepper_touch/stepper_touch.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Confirm Request",
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(26),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (_, __) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildFinalAddressPlaceholder(
                                  constraints, "PICKUP"),
                              buildFinalAddressPlaceholder(constraints, "DROP"),
                            ],
                          );
                        },
                      ),
                    ),
                    Divider(),
                    Container(
                      height: 200,
                      width: double.infinity,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Row(
                            children: [
                              Container(
                                width: constraints.maxWidth * 0.40,
                                padding: EdgeInsets.only(left: 30),
                                height: 100,
                                child: SvgPicture.asset(
                                  "assets/icons/weight.svg",
                                  color: kPrimaryColor,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 20,
                                ),
                                width: constraints.maxWidth * 0.60,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Select Weight",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            getProportionateScreenWidth(18),
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text("Swipe to change"),
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: 30,
                                          left: 20,
                                          right: 20,
                                          top: 10),
                                      child: StepperTouch(
                                        initialValue: 1,
                                        direction: Axis.horizontal,
                                        withSpring: true,
                                        primaryColor: kPrimaryColor,
                                        textColor: Colors.white,
                                        onChanged: (int value) =>
                                            print('new value $value'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Divider(),
                    PaymentLocationSelector(),
                    Divider(),
                    Container(
                      height: 100,
                      width: double.infinity,
                      child: LayoutBuilder(
                        builder: (context, constraints) => Row(
                          children: [
                            Container(
                              width: constraints.maxWidth * 0.50,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "FARE:",
                                      style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(15),
                                      ),
                                    ),
                                    Text(
                                      "40₹",
                                      style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(23),
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: constraints.maxWidth * 0.41,
                              margin: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(10)),
                              child: RaisedButton(
                                color: kPrimaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: getProportionateScreenWidth(14),
                                    vertical: getProportionateScreenHeight(14)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                animationDuration: Duration(microseconds: 1000),
                                child: Text(
                                  "Request Pickup",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  Container buildFinalAddressPlaceholder(
      BoxConstraints constraints, String title) {
    return Container(
      height: (constraints.maxWidth - 40) * 0.50,
      width: (constraints.maxWidth - 40) * 0.50,
      decoration: BoxDecoration(
        color: Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(
                color: title == "PICKUP" ? Colors.green : Colors.red,
                fontSize: getProportionateScreenWidth(18),
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "1600 Amphitheatre Pkwy, Mountain View, CA 94043, United States",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: getProportionateScreenWidth(12)),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "+919001285271",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}

class PaymentLocationSelector extends StatefulWidget {
  const PaymentLocationSelector({
    Key key,
  }) : super(key: key);

  @override
  _PaymentLocationSelectorState createState() =>
      _PaymentLocationSelectorState();
}

class _PaymentLocationSelectorState extends State<PaymentLocationSelector> {
  bool btnPickup = true;
  bool btnDrop = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Text(
                "PAYMENT AT",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(20)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(top: getProportionateScreenHeight(20)),
                    child: RaisedButton(
                      animationDuration: Duration(microseconds: 1000),
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(40),
                          vertical: getProportionateScreenHeight(12)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                      ),
                      color: btnPickup ? kPrimaryColor : Color(0xFFF2F2F2),
                      onPressed: () {
                        setState(() {
                          btnDrop = false;
                          btnPickup = true;
                        });
                      },
                      child: Text(
                        "PICKUP",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            fontWeight: FontWeight.bold,
                            color: btnPickup ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: getProportionateScreenWidth(20),
                        top: getProportionateScreenHeight(20)),
                    child: RaisedButton(
                      animationDuration: Duration(microseconds: 1000),
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(45),
                          vertical: getProportionateScreenHeight(12)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      color: btnDrop ? kPrimaryColor : Color(0xFFF2F2F2),
                      onPressed: () {
                        setState(() {
                          btnDrop = true;
                          btnPickup = false;
                        });
                      },
                      child: Text(
                        "DROP",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          fontWeight: FontWeight.bold,
                          color: btnDrop ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
