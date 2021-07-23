import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        title: Text("Profile Settings",
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            )),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Column(
              // fit: StackFit.expand,
              // overflow: Overflow.visible,
              children: [
                Text(user.displayName),
                Text(user.email),
                    // Icon(Icons.arrow_forward_ios),

                //Profile Picture
                // CircleAvatar(
                //   // backgroundImage: AssetImage("assets/images/background.jpeg"),
                //   backgroundImage: NetworkImage(user.photoURL),
                // ),
                // Positioned(
                //   right: -16,
                //   bottom: 0,
                //   child: SizedBox(
                //     height: 46,
                //     width: 46,
                //     child: FlatButton(
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(50),
                //         side: BorderSide(color: Colors.white),
                //       ),
                //       color: Color(0xFFF5F6F9),
                //       onPressed: () {},
                //       child: SvgPicture.asset("assets/svg/camera.svg"),
                //     ),
                //   ),
                // )
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: .5,
                width: screenWidth,
                color: Colors.grey,
              ),
            ),
            ProfileWidget(
              text: "My Orders",
              icon: Icon(FontAwesomeIcons.ticketAlt),
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
              text: "Logout",
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
