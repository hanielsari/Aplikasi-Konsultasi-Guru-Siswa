import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'list_card.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/data';
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController uidController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController nisController = TextEditingController();
  final TextEditingController kelasController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User _activeUser;

  @override
  void initState() {
    super.initState();
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
    // final _auth = FirebaseAuth.instance;
    // final _firestore = FirebaseFirestore.instance;
    // late User _activeUser;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Firestore Demo'),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ListView(
              children: [
                // VIEW DATA HERE
                // StreamBuilder<QuerySnapshot>(
                //   stream : users.snapshots(),
                //   builder: (_,snapshot){
                //     if (snapshot.hasData){
                //       return Column(
                //         children: ("check data" + snapshot.data!.docs.toString())
                //             .map((e) =>
                //             CardRestaurant(e.data()['nama'], e.data()['age'])).toList(),
                //         // print("check data" + snapshot.data.docs.toString());
                //       );
                //     }else{
                //       return Text('Loading');
                //     }
                //   },
                // ),
                // SizedBox(
                //   height: 150,
                // ),
              ],
            ),
            SingleChildScrollView(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(-5, 0),
                          blurRadius: 15,
                          spreadRadius: 3)
                    ]),
                    width: double.infinity,
                    height: 130,
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 160,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextField(
                                style: GoogleFonts.poppins(),
                                controller: nameController,
                                decoration: InputDecoration(hintText: "Name"),
                              ),
                              TextField(
                                style: GoogleFonts.poppins(),
                                controller: ageController,
                                decoration: InputDecoration(hintText: "Age"),
                                keyboardType: TextInputType.number,
                              ),
                              TextField(
                                style: GoogleFonts.poppins(),
                                controller: nisController,
                                decoration: InputDecoration(hintText: "Nis"),
                                keyboardType: TextInputType.number,
                              ),
                              TextField(
                                style: GoogleFonts.poppins(),
                                controller: uidController,
                                decoration: InputDecoration(hintText: "Uid ${_activeUser.uid}"),
                                keyboardType: TextInputType.number,
                              ),
                              // TextField(
                              //   style: GoogleFonts.poppins(),
                              //   controller: uidController = Text ("${_activeUser.email}",)
                              //   decoration: InputDecoration(hintText: "Kelas"),
                              //   keyboardType: TextInputType.number,
                              // ),
                            ],
                          ),
                        ),
                        Container(
                          height: 130,
                          width: 130,
                          padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              color: Colors.blue[900],
                              child: Text(
                                'Add Data',
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                //// ADD DATA HERE
                                users.add({
                                  'id'   :_auth.currentUser?.uid.toString(),
                                  'name' : nameController.text,
                                  'age' : int.tryParse(ageController.text)?? 0,
                                  'nis' : int.tryParse(nisController.text)?? 0,
                                  // 'kelas' : int.tryParse(kelasController.text)?? 0,
                                });

                                nameController.text ='';
                                ageController.text='';
                                // nisController.text='';
                                // kelasController.text='';

                              }),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ));
  }
}