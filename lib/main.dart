import 'package:capstone_project/ui/home/home_page.dart';
import 'package:capstone_project/ui/list/list_guru.dart';
import 'package:capstone_project/ui/detail/page_detail.dart';
import 'package:capstone_project/ui/navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'common/style.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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