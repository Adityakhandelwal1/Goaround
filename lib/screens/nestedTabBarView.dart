// import 'dart:ui';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:tripyojana/models/recommended_model.dart';
// import 'package:tripyojana/screens/selected_place_screen.dart';
//
// class NestedTabBar extends StatefulWidget {
//   @override
//   _NestedTabBarState createState() => _NestedTabBarState();
// }
//
// class _NestedTabBarState extends State<NestedTabBar>
//     with TickerProviderStateMixin {
//   final _pageController = PageController(viewportFraction: 0.877);
//   TabController _nestedTabController;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _nestedTabController = new TabController(length: 4, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _nestedTabController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: <Widget>[
//         Container(
//           margin: EdgeInsets.only(top: 45.0),
//           child: Text(
//             'Favourites',
//             style: GoogleFonts.playfairDisplay(
//               fontSize: 30,
//               fontWeight: FontWeight.w700,
//               color: Color(0xFF000000),
//             ),
//           ),
//         ),
//         Container(
//           height: screenHeight * 0.60,
//           margin: EdgeInsets.only(top: 10, left: 16.0, right: 16.0, bottom: 10),
//           child: TabBarView(
//             controller: _nestedTabController,
//             children: <Widget>[
//               //Recommended
//               Container(
//                 height: 218.4,
//                 margin: EdgeInsets.only(top: 16),
//                 child: PageView(
//                   physics: BouncingScrollPhysics(),
//                   controller: _pageController,
//                   scrollDirection: Axis.horizontal,
//                   children: List.generate(
//                     recommendations.length,
//                     (int index) => GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => SelectedPlaceScreen(
//                                 recommendedModel: recommendations[index])));
//                       },
//                       child: Container(
//                         margin: EdgeInsets.only(right: 28.8),
//                         width: 333.6,
//                         height: 218.4,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(9.6),
//                           image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: CachedNetworkImageProvider(
//                                 recommendations[index].image),
//                           ),
//                         ),
//                         child: Stack(
//                           children: <Widget>[
//                             Positioned(
//                               bottom: 19.2,
//                               left: 19.2,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(4.8),
//                                 child: BackdropFilter(
//                                   filter: ImageFilter.blur(
//                                       sigmaY: 19.2, sigmaX: 19.2),
//                                   child: Container(
//                                     height: 36,
//                                     padding: EdgeInsets.only(
//                                         left: 16.72, right: 14.4),
//                                     alignment: Alignment.centerLeft,
//                                     child: Row(
//                                       children: <Widget>[
//                                         SvgPicture.asset(
//                                             'assets/svg/icon_location.svg'),
//                                         SizedBox(
//                                           width: 9.52,
//                                         ),
//                                         Text(
//                                           recommendations[index].name,
//                                           style: GoogleFonts.lato(
//                                               fontWeight: FontWeight.w700,
//                                               color: Colors.white,
//                                               fontSize: 16.8),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               //Category1
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.0),
//                   color: Colors.orangeAccent,
//                 ),
//               ),
//               //Category2
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.0),
//                   color: Colors.greenAccent,
//                 ),
//               ),
//               //All
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.0),
//                   color: Colors.indigoAccent,
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
