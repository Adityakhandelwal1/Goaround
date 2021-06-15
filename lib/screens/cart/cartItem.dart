import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripyojana/models/activities_model.dart';

import '../selected_place_screen.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key key,
    @required this.pageController,
    @required this.event,
  }) : super(key: key);

  final pageController;
  final ActivitiesModel event;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.05, right:screenWidth * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                event.name,
                style: GoogleFonts.robotoCondensed(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF000000),
                ),
              ),
              Text(
                '₹ ${event.price} / Person',
                style: GoogleFonts.robotoCondensed(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF8a8a8a),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
