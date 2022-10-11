import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../../../constants.dart';
import '../../../components/default_button.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:device_info/device_info.dart';

class Body extends StatefulWidget {
  final Function signIn;
  final mobNum;
  Body(this.signIn, this.mobNum);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var enteredOtp;

  void setOtp(otp) {
    enteredOtp = otp;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.10),
              Text(
                "OTP Verification",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(32),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "We have sent you a code to +91${widget.mobNum}",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.10),
              OTPTextField(setOtp: setOtp),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              Hero(
                tag: "start_btn",
                child: DefaultButton(
                  text: "Verify",
                  press: () {
                    widget.signIn(enteredOtp, context);
                  },
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Resend OTP",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OTPTextField extends StatefulWidget {
  const OTPTextField({
    Key key,
    this.setOtp,
  }) : super(key: key);
  final Function setOtp;
  @override
  _OTPTextFieldState createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidDeviceInfo;
  String maskCharacter = "*";

  @override
  void initState() {
    super.initState();
    setSkdInfo();
  }

  void setSkdInfo() async {
    androidDeviceInfo = await deviceInfo.androidInfo;
    var skdInt = androidDeviceInfo.version.sdkInt;
    if (skdInt > 19) {
      setState(() {
        maskCharacter = lockEmoji;
      });
    } else {
      setState(() {
        maskCharacter = starEmoji;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      autofocus: true,
      hideCharacter: true,
      highlight: true,
      highlightColor: kPrimaryColor,
      defaultBorderColor: Colors.grey,
      hasTextBorderColor: Colors.black,
      maxLength: 6,
      maskCharacter: maskCharacter,
      onTextChanged: (text) {
        widget.setOtp(text);
      },
      pinBoxWidth: getProportionateScreenWidth(48),
      pinBoxHeight: getProportionateScreenWidth(48),
      hasUnderline: false,
      wrapAlignment: WrapAlignment.spaceAround,
      pinBoxDecoration: (borderColor, pinBoxColor, {borderWidth, radius}) =>
          BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      pinTextStyle: TextStyle(fontSize: 22.0),
      pinTextAnimatedSwitcherTransition:
          ProvidedPinBoxTextAnimation.scalingTransition,
      // pinBoxColor: kSecondaryColor,
      pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
//                    highlightAnimation: true,
      highlightAnimationBeginColor: Colors.black,
      highlightAnimationEndColor: Colors.white12,
      keyboardType: TextInputType.number,
    );
  }
}
