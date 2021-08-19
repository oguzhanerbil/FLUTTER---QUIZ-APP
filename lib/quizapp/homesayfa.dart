import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class Baglanti extends StatelessWidget {
  late String name;
  Baglanti(this.name);
  late String assettoload;

  setasset() {
    if (name == "Python") {
      assettoload = "assets/python.json";
    } else if (name == "Java") {
      assettoload = "assets/java.json";
    } else if (name == "Javascript") {
      assettoload = "assets/js.json";
    } else if (name == "C++") {
      assettoload = "assets/cpp.json";
    } else {
      assettoload = "assets/linux.json";
    }
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    return FutureBuilder<dynamic>(
      future:
          DefaultAssetBundle.of(context).loadString(assettoload, cache: false),
      builder: (context, data) {
        // ignore: unnecessary_question_mark
        // List<dynamic?>? myData = data.data;
        var myData = json.decode(data.data.toString());
        if (myData == null) {
          return Scaffold(
            body: Center(
              child: Text("Loading"),
            ),
          );
        } else {
          return Home(myData: myData);
        }
      },
    );
  }
}

class Home extends StatefulWidget {
  List<dynamic> myData;
  Home({Key? key, required this.myData}) : super(key: key);

  @override
  _HomeState createState() => _HomeState(myData);
}

class _HomeState extends State<Home> {
  late List<dynamic> myData;
  _HomeState(this.myData);

  Color colortoshow = Color(0xff30d5c8);
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;
  Map<String, Color> btncolor = {
    "a": Colors.white,
    "b": Colors.white,
    "c": Colors.white,
    "d": Colors.white,
  };
  void nextquest() {
    setState(() {
      if (i < 5) {
        btncolor["a"] = Colors.white;
        btncolor["b"] = Colors.white;

        btncolor["c"] = Colors.white;
        btncolor["d"] = Colors.white;
        i++;
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          elevation: 0,
          title: Text("Quiz App"),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.filter_list)),
            IconButton(onPressed: () {}, icon: Icon(Icons.menu))
          ],
        ),
        backgroundColor: Colors.orange,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 80.0, top: 20),
              child: Center(
                child: Text(
                  myData[0][i.toString()].toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(100)),
                color: Colors.black,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.white,
                      blurRadius: 100.0,
                      spreadRadius: 20.0,
                      offset: Offset(0.0, 0.75)),
                ],
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    Buton("a"),
                    Buton("b"),
                    Buton("c"),
                    Buton("d"),
                    SizedBox(height: 20)
                  ]),
            ),
          ],
        ));
  }

  bool kontrol = true;
  void checkbuton(String k) {
    if (myData[2][i.toString()] == myData[1][i.toString()][k]) {
      kontrol = false;
      colortoshow = right;
      Timer(const Duration(seconds: 1), nextquest);
    } else {
      kontrol = false;
      colortoshow = wrong;
    }
    setState(() {
      btncolor[k] = colortoshow;
    });
  }

  Material Buton(String k) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        splashColor: Colors.orange,
        highlightColor: Colors.transparent,
        onTap: () {
          setState(() {
            checkbuton(k);
          });
        },
        child: Container(
          height: MediaQuery.of(context).size.height / 15,
          width: MediaQuery.of(context).size.width - 150,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: btncolor[k]),
          child: Text(
            myData[1][i.toString()][k],
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
