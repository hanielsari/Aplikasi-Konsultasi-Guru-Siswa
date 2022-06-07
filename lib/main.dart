import 'package:capstone_project/presentation/list_guru.dart';
import 'package:capstone_project/presentation/page_detail.dart';
<<<<<<< HEAD
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
=======
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
>>>>>>> aed7cf0 (Menambahkan Home dan Login)
  }
}
