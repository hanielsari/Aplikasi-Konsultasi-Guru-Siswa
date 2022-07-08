import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/style.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/resto_detail';
  final String idDetail;
  var user = FirebaseFirestore.instance.collection('list_guru');

  RestaurantDetailPage({Key? key, required this.idDetail})
      : super(key: key);


  Widget _buildDetail() {
    return  Scaffold(
      backgroundColor: Color(0xff8CF6F0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 180,
        flexibleSpace: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // CircleAvatar(
              //   radius: 50,
              //   backgroundImage: NetworkImage(
              //     "https://restaurant-api.dicoding.dev/images/medium/" +
              //         widget.restaurant.pictureId,
              //   ),
              // ),
              SizedBox(height: 10),
              // RatingBar.builder(
              //   minRating: 1,
              //   itemBuilder: (context, _) =>
              //       Icon(Icons.star, color: Colors.amber),
              //   onRatingUpdate: (rating) {},
              // ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35)),
            color: Color(0xff98A7F2),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    idDetail,

                    // style: Theme.of(context).textTheme.subtitle1,
                  ),
                  // Text(
                  //
                  //   style: Theme.of(context).textTheme.subtitle1,
                  // ),
                  SizedBox(height: 10),
                  // Text(
                  //   'Description',
                  //   style: Theme.of(context).textTheme.subtitle1,
                  // ),
                  SizedBox(height: 10),
                  // Text('${widget.restaurant.description}',
                  //     style: Theme.of(context).textTheme.bodyText2),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 24,
                        width: 124,
                        margin: EdgeInsets.fromLTRB(35, 35, 0, 0),
                        padding: EdgeInsets.all(3),
                        child: Center(
                          child: Text('ONLINE',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                      Container(
                        height: 24,
                        width: 124,
                        margin: EdgeInsets.fromLTRB(0, 35, 35, 0),
                        padding: EdgeInsets.all(3),
                        child: Center(
                          child: Text('OFFLINE',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 24,
                        width: 124,
                        margin: EdgeInsets.fromLTRB(35, 20, 0, 0),
                        padding: EdgeInsets.all(3),
                        child: Center(
                          child: Text('CHAT',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                      Container(
                        height: 24,
                        width: 124,
                        margin: EdgeInsets.fromLTRB(0, 20, 35, 0),
                        padding: EdgeInsets.all(3),
                        child: Center(
                          child: Text('GMEET',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ElevatedButton(
                          //     onPressed: () async {
                          //       final date = await pickDate();
                          //       if (date == null) return;
                          //
                          //       final newDateTime = DateTime(
                          //         date.year,
                          //         date.month,
                          //         date.day,
                          //         dateTime.hour,
                          //         dateTime.minute,
                          //       );
                          //
                          //       setState(() => dateTime = newDateTime);
                          //     },
                          //     child: Text(
                          //       '${dateTime.year}/${dateTime.month}/${dateTime.day}',
                          //       style: TextStyle(fontSize: 20),
                          //     )),
                          const SizedBox(height: 5),
                          // ElevatedButton(
                          //   onPressed: () async {
                          //     final time = await pickTime();
                          //     if (time == null) return;
                          //
                          //     final newDateTime = DateTime(
                          //       dateTime.year,
                          //       dateTime.month,
                          //       dateTime.day,
                          //       time.hour,
                          //       time.minute,
                          //     );
                          //     setState(() => dateTime = newDateTime);
                          //   },
                          //   child: Text('$hours:$minutes',
                          //       style: TextStyle(fontSize: 20)),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 24,
                      width: 124,
                      padding: EdgeInsets.all(3),
                      margin: EdgeInsets.all(20),
                      child: Center(
                        child: Text('BOOKING',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
                  ),
                ],
              ))
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDetail();
  }
}