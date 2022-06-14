import 'package:capstone_project/widgets/list_card_api_baru.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:capstone_project/api/api_service_percobaan.dart';
import 'package:capstone_project/models/list_guru_apibaru.dart';
import 'package:capstone_project/providers/getlist_guru_apibaru.dart';
import 'package:capstone_project/widgets/list_card.dart';

import '../../common/style.dart';
// import 'package:submissiondicoding/widgets/platformwidget.dart';

class TeacherListCoba extends StatefulWidget {
  static const routeName = '/list';
  @override
  _RestaurantListPageState createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<TeacherListCoba> {
  late Future<ListGuru> _restaurant;

  @override
  void initState() {
    super.initState();
    _restaurant = ApiService().getList();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListTeachersProvider>(
      create: (_) => ListTeachersProvider(
        service_api: ApiService(),
      ),
      child: Consumer<ListTeachersProvider>(builder: (context, state, _) {
        return Scaffold(
            backgroundColor: primaryColor,
            appBar: AppBar(
              title: Text("List Guru"),
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Color(0xffF5F6F8),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/search');
                    })
              ],
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          height: MediaQuery.of(context).size.height,
                          child: _restaurantsListBuild(context))
                  ),
                ],
              ),
            ));
      }),
    );
  }
}

Widget _restaurantsListBuild(BuildContext context) {
  return Consumer<ListTeachersProvider>(builder: (context, state, _) {
    if (state.state == StateResultList.Loading) {
      return Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LinearProgressIndicator(
                minHeight: 3,
              ),
              SizedBox(
                height: 5,
              ),
              Text('Memuat Data Restoran..',
                  style: Theme.of(context).textTheme.subtitle1)
            ],
          ));
    } else if (state.state == StateResultList.HasData) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: state.result!.teachers.length,
          itemBuilder: (context, index) {
            var teacher = state.result!.teachers[index];
            return CardTeacher(teacher: teacher);
          });
    } else if (state.state == StateResultList.NoData) {
      return Center(
          child: Text(
            'Opps, restaurant yang kamu cari tidak ada',
            // style: resultText,
          ));
    }
    else if (state.state == StateResultList.Error) {
      return Center(
        child: Text(
          state.message,
        ),
      );
    } else {
      return Center(
        child: Text(''),
      );
    }
  });
}

// Widget _buildAndroid(BuildContext context) {
//   return Scaffold(
//     body: build(context),
//   );
// }
//
// Widget _buildIos(BuildContext context) {
//   return CupertinoPageScaffold(
//     navigationBar: CupertinoNavigationBar(
//       middle: Text('Restaurant App'),
//       transitionBetweenRoutes: false,
//     ),
//     child: build(context),
//   );
// }

// @override
// Widget build(BuildContext context) {
//   return PlatformWidget(
//     androidBuilder: _buildAndroid,
//     iosBuilder: _buildIos,
//   );
// }