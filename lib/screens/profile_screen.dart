import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
        title: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              //profile pic
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
            ],
          ),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 150,
      ),
      body: ListView(physics: BouncingScrollPhysics(), children: <Widget>[
        //My Account
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: FlatButton(
            padding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Color(0xFFF5F6F9),
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.account_circle_rounded),
                SizedBox(width: 20),
                Expanded(child: Text("My Account")),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),

        //Settings
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: FlatButton(
            padding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Color(0xFFF5F6F9),
            onPressed: () {
              context.read<AuthenticationService>().signOut();
            },
            child: Row(
              children: [
                Icon(Icons.settings),
                SizedBox(width: 20),
                Expanded(child: Text("Settings")),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),

        //About Us
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: FlatButton(
            padding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Color(0xFFF5F6F9),
            onPressed: () {
              context.read<AuthenticationService>().signOut();
            },
            child: Row(
              children: [
                Icon(Icons.help),
                SizedBox(width: 20),
                Expanded(child: Text("About Us")),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),

        //Contact Us
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: FlatButton(
            padding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Color(0xFFF5F6F9),
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.call),
                SizedBox(width: 20),
                Expanded(child: Text("Contact Us")),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),

        //Sign Out
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: FlatButton(
            padding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Color(0xFFF5F6F9),
            onPressed: () {
              context.read<AuthenticationService>().signOut();
            },
            child: Row(
              children: [
                Icon(Icons.logout),
                SizedBox(width: 20),
                Expanded(child: Text("Sign Out")),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
