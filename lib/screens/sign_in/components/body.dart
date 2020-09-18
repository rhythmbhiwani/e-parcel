import 'package:E_Parcel/screens/main/main_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../screens/opt_verify/opt_verify_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:flutter/material.dart';

import 'custom_suffix_icon.dart';
import 'form_error.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(100)),
                TextLiquidFill(
                  text: 'Welcome',
                  waveColor: Colors.black,
                  boxBackgroundColor: Colors.white,
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(40),
                    fontWeight: FontWeight.bold,
                  ),
                  boxHeight: getProportionateScreenHeight(100),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  'TO GET STARTED\nJUST ENTER YOU NUMBER',
                  textAlign: TextAlign.center,
                ),
                SignForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String mobNumber, smssent, verificationId;

  get verifiedSuccess => null;

  final List<String> errors = [];

  Future<void> verfiyPhone() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this.verificationId = verId;
    };
    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResent]) {
      this.verificationId = verId;
    };
    final PhoneVerificationCompleted verifiedSuccess = (AuthCredential auth) {
      Navigator.pushNamedAndRemoveUntil(
          context, MainScreen.routeName, (Route<dynamic> route) => false);
      print('DONE');
    };
    final PhoneVerificationFailed verifyFailed = (FirebaseAuthException e) {
      print('ERROR ${e.message}');
    };
    print("+91" + mobNumber);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91" + mobNumber,
      timeout: const Duration(seconds: 120),
      verificationCompleted: verifiedSuccess,
      verificationFailed: verifyFailed,
      codeSent: smsCodeSent,
      codeAutoRetrievalTimeout: autoRetrieve,
    );
  }

  Future<void> signIn(String smsCode, BuildContext context) async {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((user) async {
      print(user.user.uid + " USERID");
      var userDoc =
          FirebaseFirestore.instance.collection('customers').doc(user.user.uid);
      await userDoc.get().then((value) => {
            if (!value.exists)
              {
                userDoc.set({
                  'number': user.user.phoneNumber,
                  'accountStatus': 'normal',
                  'createdAt': new DateTime.now(),
                })
              }
          });

      Navigator.pushNamedAndRemoveUntil(
          context, MainScreen.routeName, (Route<dynamic> route) => false);
    }).catchError((e) {
      print("ERROR " + e.toString());
      var message = e.message;
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
    });
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: kSecondaryColor),
      gapPadding: 10,
    );
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(50)),
          buildNumberFormField(outlineInputBorder),
          SizedBox(height: getProportionateScreenHeight(10)),
          FormError(error: errors),
          SizedBox(height: getProportionateScreenHeight(100)),
          Hero(
            tag: "start_btn",
            child: DefaultButton(
              text: "Send OTP",
              press: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  verfiyPhone();
                  // registerUser(mobNumber, context);
                  Navigator.pushNamed(context, OTPVerifyScreen.routeName,
                      arguments: [signIn, mobNumber]);
                }
              },
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Text(
            "By continuing you confirm that you agree with our Terms and Conditions",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  TextFormField buildNumberFormField(OutlineInputBorder outlineInputBorder) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      maxLength: 10,
      onSaved: (newValue) => mobNumber = newValue,
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      onChanged: (value) {
        setState(() {
          mobNumber = value;
          print(mobNumber);
        });
        if (value.isNotEmpty && errors.contains(errMobNumEmpty)) {
          setState(() {
            errors.remove(errMobNumEmpty);
          });
        }
        if (value.length == 10 && errors.contains(errNotTenDigits)) {
          setState(() {
            errors.remove(errNotTenDigits);
          });
        }
        if (value.length == 10) {
          FocusScope.of(context).unfocus();
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(errMobNumEmpty)) {
          setState(() {
            errors.add(errMobNumEmpty);
          });
          return "";
        }
        if (value.length != 10 &&
            !errors.contains(errNotTenDigits) &&
            !errors.contains(errMobNumEmpty)) {
          setState(() {
            errors.add(errNotTenDigits);
          });
          return "";
        }
        if (value.length != 10) {
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "MOBILE NUMBER",
          hintText: "ENTER YOUR NUMBER",
          counterText: '',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
          prefixText: "+91  ",
          suffixIcon: CustomSuffixIcon(
            svgicon: "assets/icons/Call.svg",
          )),
    );
  }
}
