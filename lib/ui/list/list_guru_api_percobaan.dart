import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../common/style.dart';

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
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Color(0xffF5F6F8),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/search');
                })
          ],
        ),
        body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('listguru').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (!streamSnapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                ),
              );
            }
            return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    child: ListTile(
                        contentPadding: EdgeInsets.all(10),
                        title: Text("Nama : " +
                            streamSnapshot.data!.docs[index]['nama']),
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                streamSnapshot.data!.docs[index]['foto'],
                                scale: 1.0)),
                        subtitle: Text("Guru Matapelajaran : " +
                            streamSnapshot.data!.docs[index]['deskripsi'])),
                  );
                  // leading: Image(streamSnapshot.data!.docs[index]['foto'])); //awalan pada circle image);

                  // return ListTile(
                  //   title: Text(streamSnapshot.data?.docs[index]['nama']),
                  //   subtitle: Text(streamSnapshot.data?.docs[index]['deskripsi']),
                  // );
                });
          },
        ));
  }
}
