import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'dart:async';
import 'dart:math';
import 'package:test_uygulama/quizapp/homesayfa.dart';
import 'package:line_icons/line_icon.dart';
import 'package:http/http.dart' as http;

class bilmemne extends StatelessWidget {
  const bilmemne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late Future<dynamic> Soru;
  final pages = <Widget>[];
  PageController _myPage = PageController(initialPage: 0);

  int index = 0;

  double value = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color(0xff42a5f5),
                  Color(0xff1565c0),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
              ),
              SafeArea(
                child: Container(
                  width: 200,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      DrawerHeader(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage("images/py.png"),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Oğuzhan Erbil",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            ListTile(
                              onTap: () {
                                setState(() {
                                  value == 0 ? value = 1 : value = 0;
                                });
                              },
                              leading: Icon(
                                Icons.home,
                                color: Colors.white,
                              ),
                              title: Text(
                                "Home",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {},
                              leading: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              title: Text(
                                "Profile",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {},
                              leading: Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                              title: Text(
                                "Settings",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {},
                              leading: Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                              title: Text(
                                "Log out",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: value),
                duration: Duration(milliseconds: 500),
                curve: Curves.elasticOut, //elasticOut
                builder: (_, double val, __) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..setEntry(0, 3, 200 * val)
                      ..rotateY((pi / 6) * val),
                    child: Scaffold(
                      appBar: AppBar(
                        backgroundColor: Colors.black,
                        elevation: 0,
                        foregroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        title: Text(
                          "Quzi App",
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: IconButton(
                            onPressed: () {
                              setState(() {
                                value == 0 ? value = 1 : value = 0;
                              });
                            },
                            icon: Icon(
                              Icons.menu_open,
                              color: Colors.white,
                            )),
                      ),
                      body: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromRGBO(255, 245, 2, 1.0),
                                Color.fromRGBO(255, 183, 2, 1.0),
                              ],
                            )),
                        child: Container(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              dersler(
                                  image: "images/js.png", name: "Javascript"),
                              dersler(image: "images/py.png", name: "Python"),
                              dersler(image: "images/cpp.png", name: "C++"),
                              dersler(image: "images/java.png", name: "Java"),
                              dersler(
                                  image: "images/js.png", name: "Javascript"),
                              dersler(image: "images/py.png", name: "Python"),
                              dersler(image: "images/cpp.png", name: "C++"),
                              dersler(image: "images/java.png", name: "Java"),
                            ],
                          ),
                        ),
                      ),
                      floatingActionButton: Container(
                        height: 65.0,
                        width: 65.0,
                        child: FittedBox(
                          child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            onPressed: () {},
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage("images/cpp.png"),
                            ),
                            elevation: 5.0,
                          ),
                        ),
                      ),
                      floatingActionButtonLocation:
                          FloatingActionButtonLocation.centerDocked,
                      bottomNavigationBar: TabBarMaterialWidget(
                        index: index,
                        onChangedTab: onChangedTab,
                      ),
                    ),
                  );
                },
              ),
              /*
                  GestureDetector(
                    onHorizontalDragUpdate: (e) {
                      if (value == 1) {
                        if (e.delta.dx > 0) {
                          setState(() {
                            value = 1;
                          });
                        } else {
                          setState(() {
                            value = 0;
                          });
                        }
                      }
                    },
                    // onTap: () {
                    //   setState(() {
                    //     value == 0 ? value = 1 : value = 0;
                    //   });
                    // },
                  )
                  */
            ],
          )),
    );
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}

class dersler extends StatelessWidget {
  dersler({Key? key, required this.image, required this.name})
      : super(key: key);
  String image;
  String name;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Baglanti(name),
            ));
      },
      child: Container(
          color: Colors.transparent,
          height: 120,
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: CircleAvatar(
                        radius: 36,
                        backgroundColor: Colors.blueAccent,
                        child: CircleAvatar(
                          radius: 34,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(image),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Text(name),
                    )
                  ],
                )
              ]))),
    );
  }
}

class TabBarMaterialWidget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;

  const TabBarMaterialWidget({
    required this.index,
    required this.onChangedTab,
    Key? key,
  }) : super(key: key);

  @override
  _TabBarMaterialWidgetState createState() => _TabBarMaterialWidgetState();
}

class _TabBarMaterialWidgetState extends State<TabBarMaterialWidget> {
  @override
  Widget build(BuildContext context) {
    final placeholder = Opacity(
      opacity: 0,
      child: IconButton(icon: Icon(Icons.no_cell), onPressed: null),
    );

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildTabItem(
            index: 0,
            icon: Icon(
              LineIcons.home,
              color: Colors.orange,
            ),
          ),
          buildTabItem(
            index: 1,
            icon: Icon(
              Icons.camera_alt_outlined,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabItem({
    required int index,
    required Icon icon,
  }) {
    final isSelected = index == widget.index;

    return IconTheme(
      data: IconThemeData(
        color: isSelected ? Colors.red : Colors.black,
      ),
      child: IconButton(
        padding:
            index == 0 ? EdgeInsets.only(right: 12) : EdgeInsets.only(left: 12),
        iconSize: 30.0,
        icon: icon,
        onPressed: () => widget.onChangedTab(index),
      ),
    );
  }
}
