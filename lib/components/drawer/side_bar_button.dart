import 'package:flutter/material.dart';

class SideBarButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final double textSize;
  final double height;
  final Function onPressed;

  SideBarButton(
      {this.text, this.iconData, this.textSize, this.height, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Icon(
            iconData,
            color: Color(0xFFECECEC),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(color: Color(0xFFECECEC), fontSize: textSize),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
