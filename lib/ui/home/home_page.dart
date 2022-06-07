import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 /** int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    //const Scedhule(),
    //const Chat(),
    //const Profil()
  ];*/

 /**  @override
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Restaurant App",
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.grey.shade100,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      unselectedFontSize: 0,
      selectedFontSize: 0,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey.withOpacity(0.5),
      showUnselectedLabels: false,
      showSelectedLabels: false,
      backgroundColor: Colors.white,
      elevation: 0, //ketebalan shadow
      items: const [
        BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: 'Schedule', icon: Icon(Icons.schedule)),
        BottomNavigationBarItem(label: 'Chat', icon: Icon(Icons.chat)),
        BottomNavigationBarItem(label: 'Profil', icon: Icon(Icons.account_balance))
      ],
      onTap: (index) {
        _onItemTapped(index);
      },
    );
  }*/
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8CF6F0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 180,
        flexibleSpace: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Text("Hai, Hani"),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(''),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Positioned(
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 10),
                                blurRadius: 50,
                                color: Colors.grey.shade500.withOpacity(0.23))
                          ]),
                      child: TextField(
                        controller: controller,
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        decoration: InputDecoration(
                          hintText: 'Cari guru yang ingin kamu konsultasi',
                          hintStyle:
                              TextStyle(color: Colors.black.withOpacity(0.23)),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35)),
            color: Color(0xff98A7F2),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Top Teacher")],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              width: 130,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                image: DecorationImage(
                                    image: NetworkImage(""), fit: BoxFit.fill),
                              ),
                            )
                          ],
                        ),
                      ]),
                  Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              width: 130,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                image: DecorationImage(
                                    image: NetworkImage(""), fit: BoxFit.fill),
                              ),
                            )
                          ],
                        ),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                            padding: EdgeInsets.all(3),
                            child: Center(
                              child: Image.network(""),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                            padding: EdgeInsets.all(3),
                            child: Center(
                              child: Image.network(""),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                            padding: EdgeInsets.all(3),
                            child: Center(
                              child: Image.network(""),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                            padding: EdgeInsets.all(3),
                            child: Center(
                              child: Image.network(""),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                            padding: EdgeInsets.all(3),
                            child: Center(
                              child: Image.network(""),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                            padding: EdgeInsets.all(3),
                            child: Center(
                              child: Image.network(""),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}