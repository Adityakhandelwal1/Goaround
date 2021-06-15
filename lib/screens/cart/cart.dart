import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripyojana/models/activities_model.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cartItem.dart';

class Cart extends StatelessWidget {

  final ActivitiesModel activitiesModel;
  Cart({Key key, @required this.activitiesModel}) : super(key: key);
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: <Widget>[
          //App Bar
          Container(
            color: Colors.white38,
            child: Stack(
              children: <Widget>[
                SafeArea(
                  child: Container(
                    height: screenHeight * 0.05,
                    margin: EdgeInsets.only(
                        top: screenHeight * 0.01,
                        left: screenWidth * 0.03,
                        right: screenWidth * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            // margin: EdgeInsets.only(left: screenWidth * 0),
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(15),
                            child: Icon(Icons.arrow_back_ios),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: screenWidth * 0.15,
                              right: screenWidth * 0.15),
                          alignment: Alignment.centerRight,
                          // padding: EdgeInsets.all(15),
                          child: Text("Choose quantity",
                              maxLines: 2,
                              style: GoogleFonts.lato(
                                fontSize: 21,
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF8a8a8a),
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.all(screenWidth * 0.06),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: screenHeight * 0.8,
            margin: EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
            child:
            CartItem(pageController: _pageController, event: activitiesModel),
          ),
        ],
      ),
    );
  }
}
