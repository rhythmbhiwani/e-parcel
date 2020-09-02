import 'package:E_Parcel/components/default_button.dart';
import 'package:contact_picker/contact_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  final type;
  Body({this.type});
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final ContactPicker _contactPicker = new ContactPicker();
  Contact _contact;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 1,
        itemBuilder: (context, index) {
          return Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 50),
                  child: SvgPicture.asset("assets/icons/location.svg"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  child: Text(
                    widget.type == "pickup"
                        ? "Add Pickup Location"
                        : "Add Drop Location",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      width: SizeConfig.screenWidth * 0.85,
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: "Name",
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                    ),
                    Container(
                      width: SizeConfig.screenWidth * 0.15,
                      height: 40,
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          icon: Icon(Icons.contacts),
                          onPressed: () async {
                            Contact contact =
                                await _contactPicker.selectContact();
                            setState(() {
                              _contact = contact;
                              _nameController.text = _contact.fullName;
                              var num = _contact.phoneNumber
                                  .toString()
                                  .replaceAll(new RegExp(r"\s+|\D"), "");
                              _numberController.text =
                                  num.substring(num.length - 10);
                            });
                          }),
                    )
                  ],
                ),
                buildDataTextField(
                  hint: "Phone Number",
                  icon: Icons.phone_android,
                  type: TextInputType.number,
                  controller: _numberController,
                ),
                buildDataTextField(
                  hint: "House/Flat No.",
                  icon: Icons.home,
                ),
                buildDataTextField(
                  hint: "Area",
                  icon: Icons.domain,
                ),
                buildDataTextField(
                  hint: "City",
                  icon: Icons.location_city,
                ),
                buildDataTextField(
                  hint: "Landmark",
                  icon: Icons.location_on,
                ),
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                      width: SizeConfig.screenWidth * 0.50,
                      child: DefaultButton(
                        btnColor: Colors.grey,
                        text: "Cancel",
                        press: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                      width: SizeConfig.screenWidth * 0.50,
                      child: DefaultButton(
                        text: "Continue",
                        press: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Container buildDataTextField(
      {String hint,
      IconData icon,
      TextInputType type,
      TextEditingController controller}) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 30, right: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
