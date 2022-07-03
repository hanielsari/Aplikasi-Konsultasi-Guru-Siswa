// import 'package:capstone_project/models/detail_guru.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//
// class DetailRestaurant extends StatefulWidget {
//   static const routeName = '/restaurant_detail';
//
//   final RestaurantDetail_ restaurant;
//
//   const DetailRestaurant({Key? key, required this.restaurant})
//       : super(key: key);
//
//   @override
//   State<DetailRestaurant> createState() => _DetailRestaurantState();
// }
//
// class _DetailRestaurantState extends State<DetailRestaurant> {
//   final _firstore = FirebaseFirestore.instance.collection('list_guru');
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff8CF6F0),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//         toolbarHeight: 180,
//         flexibleSpace: Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage: NetworkImage(
//                   (_firstore)
//                 ),
//               ),
//               SizedBox(height: 10),
//               RatingBar.builder(
//                 minRating: 1,
//                 itemBuilder: (context, _) =>
//                     Icon(Icons.star, color: Colors.amber),
//                 onRatingUpdate: (rating) {},
//               ),
//             ],
//           ),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(35),
//                 bottomRight: Radius.circular(35)),
//             color: Color(0xff98A7F2),
//           ),
//         ),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//           stream:
//               FirebaseFirestore.instance.collection('list_guru').snapshots(),
//           builder: (context, snapshot) {
//             return (snapshot.connectionState == ConnectionState.waiting)
//                 ? Center(child: CircularProgressIndicator())
//                 : ListView.builder(
//                     itemCount: snapshot.data!.docs.length,
//                     itemBuilder: (context, index) {
//                       DocumentSnapshot data = snapshot.data!.docs[index];
//                       return
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             height: 24,
//                             width: 124,
//                             margin: EdgeInsets.fromLTRB(35, 35, 0, 0),
//                             padding: EdgeInsets.all(3),
//                             // decoration: BoxDecoration(
//                             //   color: Colors.white,
//                             //   borderRadius: BorderRadius.circular(35),
//                             // ),
//                             child: Center(
//                               child: TextButton(
//                                 child: Text(
//                                   'ONLINE',
//                                   style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 onPressed: () {},
//                               ),
//                             ),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(35),
//                             ),
//                           ),
//                           Container(
//                             height: 24,
//                             width: 124,
//                             margin: EdgeInsets.fromLTRB(0, 35, 35, 0),
//                             padding: EdgeInsets.all(3),
//                             child: Center(
//                               child: Text('OFFLINE',
//                                   style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold)),
//                             ),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(35),
//                             ),
//                           ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             height: 24,
//                             width: 124,
//                             margin: EdgeInsets.fromLTRB(35, 20, 0, 0),
//                             padding: EdgeInsets.all(3),
//                             child: Center(
//                               child: Text('CHAT',
//                                   style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold)),
//                             ),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(35),
//                             ),
//                           ),
//                           Container(
//                             height: 24,
//                             width: 124,
//                             margin: EdgeInsets.fromLTRB(0, 20, 35, 0),
//                             padding: EdgeInsets.all(3),
//                             child: Center(
//                               child: Text('GMEET',
//                                   style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold)),
//                             ),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(35),
//                             ),
//                           ),
//                         ],
//                           ),
//                       Center(
//                         child: Container(
//                           height: 24,
//                           width: 124,
//                           padding: EdgeInsets.all(3),
//                           margin: EdgeInsets.all(20),
//                           child: Center(
//                             child: Text('BOOKING',
//                                 style: TextStyle(
//                                     fontSize: 14, fontWeight: FontWeight.bold)),
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(35),
//                           ),
//                         ),
//                       )
//                       ]
//                       );
//                     });
//           }),
//     );
//   }
// }
