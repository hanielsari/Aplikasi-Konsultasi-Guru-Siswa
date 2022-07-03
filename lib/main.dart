import 'package:capstone_project/testlogin/chat.dart';
import 'package:capstone_project/testlogin/home.dart';
import 'package:capstone_project/testlogin/login_patch.dart';
import 'package:capstone_project/testlogin/register.dart';
import 'package:capstone_project/ui/home/home_page.dart';
// import 'package:capstone_project/ui/detail/page_detail.dart';
import 'package:capstone_project/ui/list/list_guru_api_percobaan.dart';
//import 'package:capstone_project/ui/login/login_siswa.dart';
import 'package:capstone_project/ui/navigation/bottom_navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'common/style.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Restaurant App',
        theme: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: secondaryColor,
            onPrimary: Colors.black,
            secondary: Colors.blue,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
          ),
        ),
        initialRoute: LoginPage.id,
        routes: {
          // HomePage.routeName: (context) => HomePage(),
          // RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
          //   id: ModalRoute.of(context)?.settings.arguments as String,
          // ),
          LoginPage.id: (context) => LoginPage(),
          NaviBot.routeName: (context) => NaviBot(),
          HomePage.id: (context) => HomePage(),
          Home.id: (context) => Home(),
          RegisterPage.id: (context) => RegisterPage(),
          TeacherLis.routeName: (context) => TeacherLis(),
          // RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
          //     idDetail: ModalRoute.of(context)!.settings.arguments == null
          //         ? 'null'
          //         : ModalRoute.of(context)!.settings.arguments as String),
          ChatPage.id: (context) => ChatPage(),

        });
  }
}