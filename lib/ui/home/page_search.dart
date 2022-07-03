import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class PageSearch extends StatefulWidget {
  static const routeName = '/search';
  const PageSearch({Key? key}) : super(key: key);

  @override
  State<PageSearch> createState() => _PageSearchState();
}

class _PageSearchState extends State<PageSearch> {
  String nama = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search'),
            onChanged: (val) {
              setState(() {
                nama = val;
              });
            },
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (nama != "" && nama != null)
            ? FirebaseFirestore.instance
            .collection('list_guru')
            .where("caseSearch", arrayContains: nama)
            .snapshots()
            : FirebaseFirestore.instance.collection('list_guru').snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot data = snapshot.data!.docs[index];
                return
                  ListTile(
                    title: Text(data['nama'],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            snapshot.data!.docs[index]['foto'],
                            scale: 1.0)),
                  );
              });
        },
      ),
    );
  }
}
