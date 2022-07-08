import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/style.dart';
import '../home/detail_page.dart';


class TeacherLis extends StatefulWidget {
  static const routeName = '/list';

  @override
  _TeacherListPageState createState() => _TeacherListPageState();
}

class _TeacherListPageState extends State<TeacherLis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: Text("List Guru"),
        ),
        body:  StreamBuilder<QuerySnapshot>(
          stream:  FirebaseFirestore.instance.collection('list_guru').snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot data = snapshot.data!.docs[index];
                  return InkWell(  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      var restaurant =data.id;
                      return RestaurantDetailPage(idDetail: restaurant);
                    }));
                  },

                    child: Card(
                      child: ListTile(
                          title: Text(data['nama'],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  snapshot.data!.docs[index]['foto'],
                                  scale: 1.0)),
                          subtitle:
                          Text("Guru Matapelajaran : " + snapshot.data!.docs[index]['guru_pel'])
                      ),
                    ),
                  );
                });
          },
        ));
  }
}