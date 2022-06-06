import 'package:capstone_project/presentation/list_guru.dart';
import 'package:capstone_project/presentation/page_detail.dart';
import 'package:flutter/material.dart';

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
            primary: Colors.blue,
            onPrimary: Colors.black,
            secondary: Colors.blue,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
          ),
        ),
        initialRoute: TeacherList.routeName,
        routes: {
          // HomePage.routeName: (context) => HomePage(),
          // RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
          //   id: ModalRoute.of(context)?.settings.arguments as String,
          // ),
          TeacherList.routeName: (context) => TeacherList(),
          RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              idDetail: ModalRoute.of(context)!.settings.arguments == null
                  ? 'null'
                  : ModalRoute.of(context)!.settings.arguments as String),

        });
  }
}
