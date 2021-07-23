import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tripyojana/models/activities_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'cart/cart.dart';

class SelectedPlaceScreen extends StatelessWidget {
  final _pageController = PageController();

  final ActivitiesModel activitiesModel;

  SelectedPlaceScreen({Key key, @required this.activitiesModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(

          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  // PageView for Image
                  Container(
                    height: screenHeight * 0.54,
                    child: PageView(
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        activitiesModel.images.length,
                            (int index) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                  activitiesModel.images[index]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Content
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: 346.8,
                      margin: EdgeInsets.only(
                          top: screenHeight * 0.05,
                          left: screenWidth * 0.065,
                          bottom: screenHeight * 0.05,
                          right: screenWidth * 0.065),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //Dotted Indicator
                          SmoothPageIndicator(
                            controller: _pageController,
                            count: activitiesModel.images.length,
                            effect: ExpandingDotsEffect(
                                activeDotColor: Color(0xFF8a8a8a),
                                dotColor: Color(0xFFababab),
                                dotHeight: 4.8,
                                dotWidth: 6,
                                spacing: 4.8),
                          ),
                          //Tagline
                          Padding(
                            padding: EdgeInsets.only(top: 19.2),
                            child: Text(
                              activitiesModel.tagLine,
                              maxLines: 2,
                              style: GoogleFonts.robotoCondensed(
                                  fontSize: 42.6,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                          ),
                          //Description
                          Padding(
                            padding: EdgeInsets.only(top: 19.2),
                            child: Text(
                              activitiesModel.description,
                              maxLines: 3,
                              style: GoogleFonts.robotoCondensed(
                                  fontSize: 19.2,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.065,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Start from',
                                    style: GoogleFonts.robotoCondensed(
                                        fontSize: 16.8,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '\₹ ${activitiesModel.price}',
                                    style: GoogleFonts.robotoCondensed(
                                        fontSize: 21.6,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          Cart(activitiesModel: activitiesModel)));
                                },
                                child: Container(
                                  height: 62.4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9.6),
                                      color: Colors.black),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 20, right: 20),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Buy Now',
                                            style: GoogleFonts.robotoCondensed(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                          // Icon(Icons.shopping_basket_outlined),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),

              Positioned(
                child: AppBar(
                  // title: Text("Transparent AppBar"),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.favorite_outline),
                      onPressed: () {},
                      tooltip: 'Favorite',
                    ),
                  ],
                ),
              )

            ],
          ),
        )
      ),
    );
  }
}
