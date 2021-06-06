import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripyojana/models/activities_model.dart';

import '../selected_place_screen.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({
    Key key,
    @required this.pageController,
    @required this.event,
  }) : super(key: key);

  final pageController;
  final List<ActivitiesModel> event;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.40,
      margin: EdgeInsets.only(top: 16),
      child: PageView(
        physics: BouncingScrollPhysics(),
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: List.generate(
          event.length,
          (int index) => GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      SelectedPlaceScreen(activitiesModel: event[index])));
            },
            child: Container(
                margin: EdgeInsets.only(right: 24),
                width: screenWidth,
                height: screenHeight * 0.35,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.05),
                          spreadRadius: 2,
                          blurRadius: 15,
                          offset: Offset(0, 5))
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)),
                    color: Colors.white),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: screenHeight * 0.22,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(12)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                CachedNetworkImageProvider(event[index].image),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      ListTile(
                        subtitle: Text(
                            '\₹ ${event[index].price}\n${event[index].description}',
                            style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black.withOpacity(0.6))),
                        title: Text(event[index].name,
                            style: GoogleFonts.lato(
                                fontSize: 14, fontWeight: FontWeight.w700)),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
