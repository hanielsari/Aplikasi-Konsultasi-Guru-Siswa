import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AboutApliksi extends StatelessWidget {
  const AboutApliksi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8CF6F0),
      appBar: AppBar(
        title: Text(
          "About Aplikasi"
        ),
      ),

    );
    
  }
}