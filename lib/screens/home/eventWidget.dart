import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripyojana/models/activities_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    return Scaffold(
      body: StreamBuilder(
          stream: Firestore.instance.collection('Recommend').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            return Container(
              height: screenHeight * 0.40,
              margin: EdgeInsets.only(top: 16),
              child: PageView(
                physics: BouncingScrollPhysics(),
                controller: pageController,
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  snapshot.data.documents.length,
                  (int index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SelectedPlaceScreen(
                              activitiesModel: new ActivitiesModel(
                                  snapshot.data.documents[index]['name'],
                                  snapshot.data.documents[index]['tagLine'],
                                  snapshot.data.documents[index]['image'],
                                  snapshot.data.documents[index]['images'],
                                  snapshot.data.documents[index]['description'],
                                  snapshot.data.documents[index]['price']))));
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
                                bottomRight: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12)),
                            color: Colors.white),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: screenHeight * 0.22,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12)),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: CachedNetworkImageProvider(snapshot
                                        .data.documents[index]['image']),
                                  ),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              ListTile(
                                subtitle: Text(
                                    '\₹ ${snapshot.data.documents[index]['price']}\n${snapshot.data.documents[index]['description']}',
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black.withOpacity(0.6))),
                                title: Text(
                                    snapshot.data.documents[index]['name'],
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
