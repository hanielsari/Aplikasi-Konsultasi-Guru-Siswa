import 'package:capstone_project/presentation/list_guru.dart';
import 'package:capstone_project/presentation/page_detail.dart';

import 'package:flutter/material.dart';

import 'package:capstone_project/ui/home/home_page.dart';
import 'package:capstone_project/ui/login/login_siswa.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
