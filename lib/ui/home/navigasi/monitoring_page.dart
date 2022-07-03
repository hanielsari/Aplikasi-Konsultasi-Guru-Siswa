import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Monitoring extends StatelessWidget {
  Monitoring({Key? key}) : super(key: key);
  final TextEditingController feelControler = TextEditingController();
  final TextEditingController fellNumberController = TextEditingController();
  final TextEditingController penilaianNumberController =
  TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User _activeUser;

  @override
  void initState() {
    _getCurrentUser();
  }

  void _getCurrentUser() {
    try {
      var currentUser = _auth.currentUser;

      if (currentUser != null) {
        _activeUser = currentUser;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('monitoring');

    return Scaffold(
      backgroundColor: Color(0xff8CF6F0),
      appBar: AppBar(
        title: Text("Monitoring"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:  EdgeInsets.symmetric(vertical: 100, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.white, spreadRadius: 3,blurRadius: 10),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30),
              Text("Bagaimana Keadaan anda saat ini?"),
              TextField(
                controller: feelControler,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0))),
              ),
              SizedBox(height: 30),
              Text("Berapa nilai suasana hatimu dari skala 1-10?"),
              TextField(
                controller: fellNumberController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0))),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 30),
              Text("Apakah kamu sudah melakukan konsultasi untuk minggu ini?"),
              TextField(
                controller: penilaianNumberController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0))),
                keyboardType: TextInputType.number,
              ),
              RaisedButton(
                child: const Text('Tambahkan'),
                onPressed: () {
                  //// ADD DATA HERE
                  users.add({
                    'id': _auth.currentUser?.uid.toString(),
                    'perasaan': feelControler.text,
                    'skala_perasaan':
                    int.tryParse(penilaianNumberController.text) ?? 0,
                    'penilaian': penilaianNumberController.text
                    // 'kelas' : int.tryParse(kelasController.text)?? 0,
                  });
                  feelControler.text = '';
                  penilaianNumberController.text = '';
                  fellNumberController.text = '';
                  // kelasController.text='';
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}