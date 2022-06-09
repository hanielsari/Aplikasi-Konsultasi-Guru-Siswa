import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:submissiondicoding/common/style.dart';
import 'package:capstone_project/models/list_guru.dart';

import '../presentation/page_detail.dart';
// import 'package:submissiondicoding/common/navigation.dart';
// import 'package:submissiondicoding/ui/detail_page.dart';

class CardRestaurant extends StatelessWidget {
  final Restaurant restaurant;

  const CardRestaurant({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return RestaurantDetailPage(idDetail: restaurant.id);
          }));
        },
        child: Container(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Card(
            elevation: 8,
            color: Colors.amber.shade50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        width: 130,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}"),
                              fit: BoxFit.fill),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 5),
                        child: Text(
                          restaurant.name,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            Icon(
                              Icons.subject,
                              color: Colors.blue,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Text("Guru Mapel : " + restaurant.city),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            Icon(
                              Icons.timelapse_rounded,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Text("${restaurant.rating}"),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  // subtitle: Text(restaurant.city),
                ]),
          ),
        ));
  }
}
