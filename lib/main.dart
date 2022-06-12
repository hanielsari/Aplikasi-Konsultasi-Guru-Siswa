import 'package:capstone_project/ui/home/home_page.dart';
import 'package:capstone_project/ui/list/list_guru.dart';
import 'package:capstone_project/ui/detail/page_detail.dart';
import 'package:capstone_project/ui/login/login_siswa.dart';
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
        initialRoute: NaviBot.routeName,
        routes: {
          // HomePage.routeName: (context) => HomePage(),
          // RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
          //   id: ModalRoute.of(context)?.settings.arguments as String,
          // ),
          LoginPage.routeName: (context) => LoginPage(),
          NaviBot.routeName: (context) => NaviBot(),
          HomePage.routeName: (context) => HomePage(),
          TeacherList.routeName: (context) => TeacherList(),
          RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              idDetail: ModalRoute.of(context)!.settings.arguments == null
                  ? 'null'
                  : ModalRoute.of(context)!.settings.arguments as String),

        });
  }
}