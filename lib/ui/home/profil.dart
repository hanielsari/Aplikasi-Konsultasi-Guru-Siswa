// import 'package:capstone_project/models/detail_guru.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//
// class ProfilPage extends StatefulWidget {
//   static const routeName = '/profilPage';
//
//
//   const ProfilPage({Key? key, required this.restaurant})
//       : super(key: key);
//
//   @override
//   State<ProfilPage> createState() => _DetailRestaurantState();
// }
//
// class _DetailRestaurantState extends State<ProfilPage> {
//   DateTime dateTime = DateTime(2022, 06, 10, 5, 30);
//
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
//                   "https://restaurant-api.dicoding.dev/images/medium/" +
//                       widget.restaurant.pictureId,
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
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(children: <Widget>[
//
//         ]),
//       ),
//     );
//   }
// }
//
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class pageProfile extends StatelessWidget {
  const pageProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xff98A7F2),
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: Center(
          child: Column(children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 70.0,
            )
          ]),
        ),
      ),
    );
  }
}
