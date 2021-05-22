import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripyojana/screens/home.dart';
import 'package:tripyojana/screens/profile_screen.dart';
import 'package:tripyojana/utils/authentication_service.dart';
import 'package:provider/provider.dart';

import 'nestedTabBarView.dart';

class HomeScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController _tabController;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _tabController = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 86.4,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 15,
              offset: Offset(0, 5))
        ]),
        child: TabBar(
          controller: _tabController,
          indicatorColor: Colors.teal,
          labelColor: Colors.teal,
          unselectedLabelColor: Colors.black54,
          tabs: <Widget>[
            Tab(
              icon: _selectedIndex == 0
                  ? new SvgPicture.asset('assets/svg/icon_home_colored.svg')
                  : new SvgPicture.asset('assets/svg/icon_home.svg'),
            ),
            Tab(
              icon: _selectedIndex == 1
                  ? new SvgPicture.asset('assets/svg/icon_heart_colored.svg')
                  : new SvgPicture.asset('assets/svg/icon_heart.svg'),
            ),
            Tab(
              icon: _selectedIndex == 2
                  ? new SvgPicture.asset(
                      'assets/svg/icon_notification_colored.svg')
                  : new SvgPicture.asset('assets/svg/icon_notification.svg'),
            ),
            Tab(
              icon: _selectedIndex == 3
                  ? new SvgPicture.asset('assets/svg/icon_user_colored.svg')
                  : new SvgPicture.asset('assets/svg/icon_user.svg'),
            ),
          ],
          onTap: _onItemTapped,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          //Home Screen
          Home(),
          // Favourites
          Center(
            child: Text("Favourites"),
          ),
          // Notifications
          Center(
            child: Text("Notifications"),
          ),
          //profile - sign out
          UserProfile()
        ],
        controller: _tabController,
      ),
    );
  }
}
