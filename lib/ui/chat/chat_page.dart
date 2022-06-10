import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.blue[700],
      leadingWidth: 100,
        leading: InkWell(
          onTap: (){},
          borderRadius: BorderRadius.circular(100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 5),
              Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey,
                child: Image.network(""),
              )
            ]
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Lorem Ipsum", style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),),
            Text("online", style: TextStyle(
              fontSize: 14,
            ),),
          ],
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Color(0xff8CF6F0),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: 500,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon:Icon(Icons.emoji_emotions_outlined) ,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100)
                        ),
                      ),),
                  ),
                ),
                SizedBox(width: 5),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.pink,
                  child: Icon(Icons.send, color:Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    ); 
  }
}