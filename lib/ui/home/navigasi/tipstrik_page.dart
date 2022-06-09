import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TipsTrikPage extends StatelessWidget {
  const TipsTrikPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8CF6F0),
      appBar: AppBar(
        title: Text(
          "Tips and Trik"
        ),
      ),

    );
    
  }
}