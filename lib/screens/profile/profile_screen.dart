import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripyojana/screens/profile/profileWidget.dart';
import 'package:tripyojana/utils/authentication_service.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<UserProfile>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: Text("My Profile",
          style: GoogleFonts.lato(
            fontSize: 21,
            fontWeight: FontWeight.w500,
            color: Color(0xFF8a8a8a),
          )),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 115,
              width: 115,
              child: Stack(
                fit: StackFit.expand,
                overflow: Overflow.visible,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/background.jpeg"),
                  ),
                  Positioned(
                    right: -16,
                    bottom: 0,
                    child: SizedBox(
                      height: 46,
                      width: 46,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(color: Colors.white),
                        ),
                        color: Color(0xFFF5F6F9),
                        onPressed: () {},
                        child: SvgPicture.asset("assets/svg/camera.svg"),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            ProfileWidget(
              text: "Tickets",
              icon: Icon(Icons.money),
              press: () => {},
            ),
            ProfileWidget(
              text: "About Us",
              icon: Icon(Icons.question_answer_outlined),
              press: () {},
            ),
            ProfileWidget(
              text: "Settings",
              icon: Icon(Icons.settings),
              press: () {},
            ),
            ProfileWidget(
              text: "Contact Us",
              icon: Icon(Icons.call),
              press: () {},
            ),
            ProfileWidget(
              text: "Sign Out",
              icon: Icon(Icons.logout),
              press: () {
                context.read<AuthenticationService>().signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
