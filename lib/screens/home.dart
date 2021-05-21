import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tripyojana/models/activities_model.dart';
import 'package:tripyojana/models/beach_model.dart';
import 'package:tripyojana/models/popular_model.dart';
import 'package:tripyojana/screens/selected_place_screen.dart';

class Home extends StatefulWidget {
  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<Home> with TickerProviderStateMixin {
  TabController _nestedTabController;
  // List recommendationList = [];

  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 7, vsync: this);
    // fetchDbList();
  }

  // fetchDbList() async {
  //   dynamic resultant = await FirestoreManager().getUsersList();
  //   if (resultant == null) {
  //     print('Unable to retrieve');
  //   } else {
  //     setState(() {
  //       recommendationList = resultant;
  //     });
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  final _pageController = PageController(viewportFraction: 0.877);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return ListView(
      // body: SafeArea(
      //   child: Container(
      //     child: ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        // Custom Navigation Drawer and Search Button
        Container(
          height: 57.6,
          margin: EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 57.6,
                width: 57.6,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.6),
                  color: Color(0x080a0928),
                ),
                child: SvgPicture.asset('assets/svg/icon_drawer.svg'),
              ),
              Container(
                height: 57.6,
                width: 57.6,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.6),
                  color: Color(0x080a0928),
                ),
                child: SvgPicture.asset('assets/svg/icon_search.svg'),
              )
            ],
          ),
        ),

        // Text Widget for Title - Explore Goa on App
        Padding(
          padding: EdgeInsets.only(top: 48, left: 28.8),
          child: Text(
            'Explore\nGoa On App',
            style: GoogleFonts.playfairDisplay(
                fontSize: 45.6, fontWeight: FontWeight.w500),
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
              // indicatorSize: TabBarIndicatorSize.label,
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
          height: screenHeight * 0.27,
          margin: EdgeInsets.only(left: 16.0, right: 16.0),
          child: TabBarView(
            controller: _nestedTabController,
            children: <Widget>[
              //Recommended
              Container(
                height: 218.4,
                margin: EdgeInsets.only(top: 16),
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    recommendations.length,
                    // recommendationList.length,
                    (int index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SelectedPlaceScreen(
                                activitiesModel: recommendations[index])));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 28.8),
                        width: 333.6,
                        height: 218.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          image: DecorationImage(
                            fit: BoxFit.cover,

                            image: CachedNetworkImageProvider(
                                recommendations[index].image),
                              // recommendationList[index]['image']),

                              // recommendationList[index].image),
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: ClipRRect(
                                // borderRadius: BorderRadius.circular(4.8),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaY: 19.2, sigmaX: 19.2),
                                  child: Container(
                                    height: 36,
                                    padding: EdgeInsets.only(
                                        left: 16.72, right: 14.4),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        SvgPicture.asset(
                                            'assets/svg/icon_location.svg'),
                                        SizedBox(
                                          width: 9.52,
                                        ),
                                        Text(
                                          recommendations[index].name,
                                          // recommendationList[index]['name'],
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 16.8),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //Off Beat Activities
              Container(
                height: 218.4,
                margin: EdgeInsets.only(top: 16),
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    offBeatActivities.length,
                    // recommendationList.length,
                    (int index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SelectedPlaceScreen(
                                activitiesModel: offBeatActivities[index])));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 28.8),
                        width: 333.6,
                        height: 218.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          image: DecorationImage(
                            fit: BoxFit.cover,

                            image: CachedNetworkImageProvider(
                                offBeatActivities[index].image),
                            // recommendationList[index]['image']),

                            // recommendationList[index].image),
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 19.2,
                              left: 19.2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.8),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaY: 19.2, sigmaX: 19.2),
                                  child: Container(
                                    height: 36,
                                    padding: EdgeInsets.only(
                                        left: 16.72, right: 14.4),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        SvgPicture.asset(
                                            'assets/svg/icon_location.svg'),
                                        SizedBox(
                                          width: 9.52,
                                        ),
                                        Text(
                                          offBeatActivities[index].name,
                                          // recommendationList[index]['name'],
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 16.8),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //Co-Working Space
              Container(
                height: 218.4,
                margin: EdgeInsets.only(top: 16),
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    coWorkingSpace.length,
                    // recommendationList.length,
                    (int index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SelectedPlaceScreen(
                                activitiesModel: coWorkingSpace[index])));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 28.8),
                        width: 333.6,
                        height: 218.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          image: DecorationImage(
                            fit: BoxFit.cover,

                            image: CachedNetworkImageProvider(
                                coWorkingSpace[index].image),
                            // recommendationList[index]['image']),

                            // recommendationList[index].image),
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 19.2,
                              left: 19.2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.8),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaY: 19.2, sigmaX: 19.2),
                                  child: Container(
                                    height: 36,
                                    padding: EdgeInsets.only(
                                        left: 16.72, right: 14.4),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        SvgPicture.asset(
                                            'assets/svg/icon_location.svg'),
                                        SizedBox(
                                          width: 9.52,
                                        ),
                                        Text(
                                          coWorkingSpace[index].name,
                                          // recommendationList[index]['name'],
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 16.8),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //Staycation
              Container(
                height: 218.4,
                margin: EdgeInsets.only(top: 16),
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    staycation.length,
                    // recommendationList.length,
                    (int index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SelectedPlaceScreen(
                                activitiesModel: staycation[index])));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 28.8),
                        width: 333.6,
                        height: 218.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          image: DecorationImage(
                            fit: BoxFit.cover,

                            image: CachedNetworkImageProvider(
                                staycation[index].image),
                            // recommendationList[index]['image']),

                            // recommendationList[index].image),
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 19.2,
                              left: 19.2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.8),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaY: 19.2, sigmaX: 19.2),
                                  child: Container(
                                    height: 36,
                                    padding: EdgeInsets.only(
                                        left: 16.72, right: 14.4),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        SvgPicture.asset(
                                            'assets/svg/icon_location.svg'),
                                        SizedBox(
                                          width: 9.52,
                                        ),
                                        Text(
                                          staycation[index].name,
                                          // recommendationList[index]['name'],
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 16.8),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //Tourist Attraction
              Container(
                height: 218.4,
                margin: EdgeInsets.only(top: 16),
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    touristAttraction.length,
                    // recommendationList.length,
                    (int index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SelectedPlaceScreen(
                                activitiesModel: touristAttraction[index])));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 28.8),
                        width: 333.6,
                        height: 218.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          image: DecorationImage(
                            fit: BoxFit.cover,

                            image: CachedNetworkImageProvider(
                                touristAttraction[index].image),
                            // recommendationList[index]['image']),

                            // recommendationList[index].image),
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 19.2,
                              left: 19.2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.8),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaY: 19.2, sigmaX: 19.2),
                                  child: Container(
                                    height: 36,
                                    padding: EdgeInsets.only(
                                        left: 16.72, right: 14.4),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        SvgPicture.asset(
                                            'assets/svg/icon_location.svg'),
                                        SizedBox(
                                          width: 9.52,
                                        ),
                                        Text(
                                          touristAttraction[index].name,
                                          // recommendationList[index]['name'],
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 16.8),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //Party
              Container(
                height: 218.4,
                margin: EdgeInsets.only(top: 16),
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    parties.length,
                    // recommendationList.length,
                    (int index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SelectedPlaceScreen(
                                activitiesModel: parties[index])));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 28.8),
                        width: 333.6,
                        height: 218.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          image: DecorationImage(
                            fit: BoxFit.cover,

                            image: CachedNetworkImageProvider(
                                parties[index].image),
                            // recommendationList[index]['image']),

                            // recommendationList[index].image),
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 19.2,
                              left: 19.2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.8),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaY: 19.2, sigmaX: 19.2),
                                  child: Container(
                                    height: 36,
                                    padding: EdgeInsets.only(
                                        left: 16.72, right: 14.4),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        SvgPicture.asset(
                                            'assets/svg/icon_location.svg'),
                                        SizedBox(
                                          width: 9.52,
                                        ),
                                        Text(
                                          parties[index].name,
                                          // recommendationList[index]['name'],
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 16.8),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //Cafes
              Container(
                height: 218.4,
                margin: EdgeInsets.only(top: 16),
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    cafes.length,
                    // recommendationList.length,
                    (int index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SelectedPlaceScreen(
                                activitiesModel: cafes[index])));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 28.8),
                        width: 333.6,
                        height: 218.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          image: DecorationImage(
                            fit: BoxFit.cover,

                            image:
                                CachedNetworkImageProvider(cafes[index].image),
                            // recommendationList[index]['image']),

                            // recommendationList[index].image),
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 19.2,
                              left: 19.2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.8),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaY: 19.2, sigmaX: 19.2),
                                  child: Container(
                                    height: 36,
                                    padding: EdgeInsets.only(
                                        left: 16.72, right: 14.4),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        SvgPicture.asset(
                                            'assets/svg/icon_location.svg'),
                                        SizedBox(
                                          width: 9.52,
                                        ),
                                        Text(
                                          cafes[index].name,
                                          // recommendationList[index]['name'],
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 16.8),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
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
                style: GoogleFonts.playfairDisplay(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF000000),
                ),
              ),
              Text(
                'Show All ',
                style: GoogleFonts.lato(
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
          margin: EdgeInsets.only(top: 28.8, bottom: 16.8),
          height: 124.8,
          child: ListView.builder(
            itemCount: beaches.length,
            padding: EdgeInsets.only(left: 28.8, right: 12),
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                height: 124.8,
                width: 188.4,
                margin: EdgeInsets.only(right: 16.8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.6),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(beaches[index].image),
                  ),
                ),
              );
            },
          ),
        ),

        // Text Widget for Explore Solo
        Padding(
          padding: EdgeInsets.only(top: 48, left: 28.8, right: 28.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Explore Solo',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF000000),
                ),
              ),
              Text(
                'Show All ',
                style: GoogleFonts.lato(
                  fontSize: 16.8,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF8a8a8a),
                ),
              )
            ],
          ),
        ),

        // ListView for Explore on your own Section
        Container(
          margin: EdgeInsets.only(top: 28.8, bottom: 16.8),
          height: 124.8,
          child: ListView.builder(
            itemCount: beaches.length,
            padding: EdgeInsets.only(left: 28.8, right: 12),
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                height: 124.8,
                width: 188.4,
                margin: EdgeInsets.only(right: 16.8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.6),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(beaches[index].image),
                  ),
                ),
              );
            },
          ),
        ),

        // Text Widget for Explore in a Group
        Padding(
          padding: EdgeInsets.only(top: 48, left: 28.8, right: 28.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Explore in a Group',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF000000),
                ),
              ),
              Text(
                'Show All ',
                style: GoogleFonts.lato(
                  fontSize: 16.8,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF8a8a8a),
                ),
              )
            ],
          ),
        ),

        // ListView for Explore on your own Section
        Container(
          margin: EdgeInsets.only(top: 28.8, bottom: 16.8),
          height: 124.8,
          child: ListView.builder(
            itemCount: beaches.length,
            padding: EdgeInsets.only(left: 28.8, right: 12),
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                height: 124.8,
                width: 188.4,
                margin: EdgeInsets.only(right: 16.8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.6),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(beaches[index].image),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
