import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:submissiondicoding/common/style.dart';
import 'package:capstone_project/models/list_guru_apibaru.dart';

import '../ui/detail/page_detail.dart';
// import 'package:submissiondicoding/common/navigation.dart';
// import 'package:submissiondicoding/ui/detail_page.dart';

class CardTeacher extends StatelessWidget {
  final Teacher teacher;

  const CardTeacher({required this.teacher});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return RestaurantDetailPage(idDetail: teacher.teacherId
            );
          }));
        },
        child: Container(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Card(
            elevation: 8,
            color: Colors.blue,
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
                      // Container(
                      //   width: 130,
                      //   height: 90,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      //     image: DecorationImage(
                      //         image: NetworkImage(
                      //             "https://restaurant-api.dicoding.dev/images/small/${teacher.profilePhotoPath}"),
                      //         fit: BoxFit.fill),
                      //   ),
                      // )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 5),
                        child: Text(
                          teacher.name,
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
                              child: Text("Guru Mapel : " + teacher.subject),
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
                              child: Text("${teacher.rate}"),
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