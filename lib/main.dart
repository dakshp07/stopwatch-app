import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final dur= const Duration(seconds: 1);
  var time = "00:00:00";
  var swatch=Stopwatch();

  void starttimer(){
    Timer(dur, keeprunning);
  }

  void keeprunning(){
    if (swatch.isRunning){
      starttimer();
    }
    setState(() {
      time=swatch.elapsed.inHours.toString().padLeft(2,"0")+":"
          +(swatch.elapsed.inMinutes%60).toString().padLeft(2,"0")+":"
          +(swatch.elapsed.inSeconds%60).toString().padLeft(2,"0");

    });
  }

   void startwatch(){
     swatch.start();
     starttimer();
   }
   void stopwatch(){
    swatch.stop();
   }
   void resetwatch(){

    swatch.reset();
    time="00:00:00";
    
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Stopwatch",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(time,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 70),),
          new Padding(padding: const EdgeInsets.all(40)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new FloatingActionButton(
                child:
                Icon(Icons.play_arrow,color: Colors.white,size: 40),
                backgroundColor: Colors.green,
                onPressed:  startwatch ,
              ),
              new FloatingActionButton(
                child:
                Icon(Icons.stop,color: Colors.white,size: 40),
                backgroundColor: Colors.yellow,
                onPressed:  stopwatch,
              ),
              new FloatingActionButton(
                child:
                Icon(Icons.refresh,color: Colors.white,size: 40,),
                backgroundColor: Colors.red,
                onPressed: resetwatch,
              )
            ],
          )
        ],
      ),
    );
  }
}

