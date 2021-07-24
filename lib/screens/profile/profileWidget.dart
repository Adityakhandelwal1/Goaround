import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key key,
    @required this.text,
    @required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final Icon icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        // color: Color(0xFFF5F6F9),
        color: Colors.white,
        onPressed: press,
        child: Row(
          children: [
            icon,
            SizedBox(width: 20),
            Expanded(child: Text(text)),
            // Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}