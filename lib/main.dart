import 'dart:async';

import 'package:flutter/material.dart';
import 'package:splash_screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', key: Key("jhg"),),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required Key key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    // TODO: implement initState
    super.initState();
    startSplashScreenTimer();
  }

  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 10);
    return new Timer(_duration, navigationToNextPage);

  }

  void navigationToNextPage() async {
    Navigator.pushAndRemoveUntil(
      context, new MaterialPageRoute(builder: (context) =>
    new secondPage()),
          (Route<dynamic> route) => false,//
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[300],
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,

            children:[
              SizedBox(height: 100,),
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                child: Text('Splash 😍', style:TextStyle(color: Colors.black, fontSize: 20)),
              ),
              SizedBox(height: 50,),
              CircularProgressIndicator(
                backgroundColor: Colors.pink[300],
              ),
              Container(
                  padding: EdgeInsets.only(top: 20, bottom: 50),
                  child: Text('Splash Screen Example', style: TextStyle(color: Colors.amber, fontSize: 25),))
            ]
        ),
      ),
    );
  }
}