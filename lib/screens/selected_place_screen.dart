import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tripyojana/models/activities_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SelectedPlaceScreen extends StatelessWidget {
  final _pageController = PageController();

  final ActivitiesModel activitiesModel;

  SelectedPlaceScreen({Key key, @required this.activitiesModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            // PageView for Image
            Container(
              height: screenHeight*0.5,
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


            // Custom Button
            SafeArea(
              child: Container(
                height: 57.6,
                margin: EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(15),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                    ),
                    Container(
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(18),
                        child: Icon(Icons.favorite_outline))
                  ],
                ),
              ),
            ),

            // Content
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 346.8,
                margin: EdgeInsets.only(left: 28.8, bottom: 48, right: 28.8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: activitiesModel.images.length,
                      effect: ExpandingDotsEffect(
                          activeDotColor: Colors.black,
                          dotColor: Colors.black,
                          dotHeight: 4.8,
                          dotWidth: 6,
                          spacing: 4.8),
                    ),
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
                      height: 48,
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
                        Container(
                          height: 62.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.6),
                              color: Colors.black),
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.8, right: 20.8),
                              child: Row(
                                children: [
                                  Text(
                                    'Add to Cart  ',
                                    style: GoogleFonts.robotoCondensed(
                                        fontSize: 19.2,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  // Icon(Icons.shopping_basket_outlined),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
