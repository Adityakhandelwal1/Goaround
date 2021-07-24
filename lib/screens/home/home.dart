import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tripyojana/models/activities_model.dart';
import 'package:tripyojana/models/offers_model.dart';
import 'package:tripyojana/screens/home/miniEventWidget.dart';

import 'eventWidget.dart';

class Home extends StatefulWidget {
  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<Home> with TickerProviderStateMixin {
  TabController _nestedTabController;

  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 7, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  final _pageController = PageController(viewportFraction: 0.877);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        // Custom AppBar and Search Button
        Container(
          height: 57.6,
          margin: EdgeInsets.only(
              top: screenHeight * 0.01,
              bottom: screenHeight * 0.01,
              left: screenWidth * 0.05,
              right: screenWidth * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Goaround',
                style: GoogleFonts.robotoCondensed(
                    fontSize: 27, fontWeight: FontWeight.w500),
              ),
              Container(
                height: 57.6,
                width: 57.6,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.6),
                  color: Colors.transparent,
                ),
                child: SvgPicture.asset('assets/svg/icon_search.svg'),
              )
            ],
          ),
        ),

        //Image Slider - Offers, Discount Coupons, Events
        Container(
          margin: EdgeInsets.only(bottom: 16.8),
          height: screenHeight * 0.2,
          child: ListView.builder(
            itemCount: offers.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                height: 124.8,
                width: screenWidth * 0.8,
                decoration: BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage(offers[index].image),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),

        // Tab scroller for categories
        Container(
          height: 30,
          margin: EdgeInsets.only(left: 14.4, top: 28.8),
          child: DefaultTabController(
            length: 4,
            child: TabBar(
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.0, color: Colors.black),
              ),
              labelPadding: EdgeInsets.only(left: 14.4, right: 14.4),
              indicatorPadding: EdgeInsets.only(left: 14.4, right: 14.4),
              isScrollable: true,
              labelColor: Color(0xFF000000),
              unselectedLabelColor: Color(0xFF8a8a8a),
              labelStyle:
                  GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w700),
              unselectedLabelStyle:
                  GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w700),
              indicatorWeight: 1.4,
              indicatorSize: TabBarIndicatorSize.label,
              controller: _nestedTabController,
              indicatorColor: Colors.black,
              tabs: <Widget>[
                Tab(
                  text: "Recommended",
                ),
                Tab(
                  text: "Off Beat Activities",
                ),
                Tab(
                  text: "Co-Working Space",
                ),
                Tab(
                  text: "Staycation",
                ),
                Tab(
                  text: "Tourist Attraction",
                ),
                Tab(
                  text: "Party",
                ),
                Tab(
                  text: "Cafes",
                ),
              ],
            ),
          ),
        ),
        // Image Tab scroller for categories
        Container(
          height: screenHeight * 0.33,
          margin: EdgeInsets.only(left: 12.0, right: 12.0),
          child: TabBarView(
            controller: _nestedTabController,
            children: <Widget>[
              //Recommended
              EventWidget(
                pageController: _pageController,
                event: recommendations,
              ),

              // Off Beat Activities
              EventWidget(
                pageController: _pageController,
                event: offBeatActivities,
              ),

              //Co-Working Space
              EventWidget(
                pageController: _pageController,
                event: coWorkingSpace,
              ),

              //Staycation
              EventWidget(
                pageController: _pageController,
                event: staycation,
              ),

              //Tourist Attraction
              EventWidget(
                pageController: _pageController,
                event: touristAttraction,
              ),

              //Party
              EventWidget(
                pageController: _pageController,
                event: parties,
              ),

              //Cafes
              EventWidget(
                pageController: _pageController,
                event: cafes,
              ),
            ],
          ),
        ),

        // Dots Indicator
        // Using SmoothPageIndicator Library
        Padding( 
          padding: EdgeInsets.only(left: 28.8, top: 28.8),
          child: SmoothPageIndicator(
            controller: _pageController,
            count: recommendations.length,
            // count: recommendationList.length,
            effect: ExpandingDotsEffect(
                activeDotColor: Color(0xFF8a8a8a),
                dotColor: Color(0xFFababab),
                dotHeight: 4.8,
                dotWidth: 6,
                spacing: 4.8),
          ),
        ),

        // Text Widget for Recently Viewed
        Padding(
          padding: EdgeInsets.only(top: 48, left: 28.8, right: 28.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Recently Viewed',
                style: GoogleFonts.robotoCondensed(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF000000),
                ),
              ),
              Text(
                'Show All ',
                style: GoogleFonts.robotoCondensed(
                  fontSize: 16.8,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF8a8a8a),
                ),
              )
            ],
          ),
        ),

        // ListView for Recently Viewed Section
        Container(
          height: screenHeight * 0.215,
          margin: EdgeInsets.only(left: screenWidth * 0.05, right: 12.0),
          child: MiniEventWidget(
              pageController: _pageController, event: recommendations),
        ),

        // Text Widget for Featured Events
        Padding(
          padding: EdgeInsets.only(top: 48, left: 28.8, right: 28.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Featured Events',
                style: GoogleFonts.robotoCondensed(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF000000),
                ),
              ),
              Text(
                'Show All ',
                style: GoogleFonts.robotoCondensed(
                  fontSize: 16.8,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF8a8a8a),
                ),
              )
            ],
          ),
        ),

        // ListView for Featured Events Section
        Container(
          height: screenHeight * 0.215,
          margin: EdgeInsets.only(left: screenWidth * 0.05, right: 12.0),
          child: MiniEventWidget(
              pageController: _pageController, event: offBeatActivities),
        ),

        // Text Widget for Parties
        Padding(
          padding: EdgeInsets.only(top: 48, left: 28.8, right: 28.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Parties',
                style: GoogleFonts.robotoCondensed(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF000000),
                ),
              ),
              Text(
                'Show All ',
                style: GoogleFonts.robotoCondensed(
                  fontSize: 16.8,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF8a8a8a),
                ),
              )
            ],
          ),
        ),

        // ListView for Parties Section
        Container(
          height: screenHeight * 0.215,
          margin: EdgeInsets.only(left: screenWidth * 0.05, right: 12.0),
          child:
              MiniEventWidget(pageController: _pageController, event: parties),
        ),
        SizedBox(height: screenHeight * 0.02),
      ],
    );
  }
}
