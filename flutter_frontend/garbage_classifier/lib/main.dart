import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'leaderBoardPage.dart';
import 'package:http/http.dart' as http;


//https://quickstart-image-rvoiadg33q-uc.a.run.app/leaderboard
void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: MyHome()
    );
  }
}

//class _MyAppState extends State<MyApp> {
class MyHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme:
    ThemeData(brightness: Brightness.dark,
        primaryColor:Colors.blueGrey),
      home: Scaffold(
        appBar:  AppBar(title: Text('Garbify', textAlign: TextAlign.center,),
        ),
        body: Column(
            children: <Widget> [Container(
                margin:  EdgeInsets.only(top:50),
                child: Center(
                    child: Image(image: AssetImage('test_imgs/profile.png'))
                )
            ),
              Container(
                  margin: EdgeInsets.only(top:10),
                  child: Center(
                    child: Text('chrisye1',textAlign:TextAlign.center,),
                  )
              ),
              Container(
                  margin: EdgeInsets.only(top:10),
                  child: Center(
                    child: Text('5000',textAlign:TextAlign.center,),
                  )
              ),
              // button
              Container(
                alignment: Alignment.bottomLeft,
                child: RaisedButton(
                      onPressed: () {
                                      Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context)=>leaderBoardPage() )
                                                  );
                                          },
                      child: const Text('Leaderboard Dashboard!', style: TextStyle(fontSize: 20) ),
                      color: Colors.blue,
                      textColor: Colors.white,
                      elevation: 5,
                ),
              ),
            ]
        ),

        floatingActionButton: new FloatingActionButton(tooltip: 'Pick Image',child: new Icon(Icons.camera) ,),
      ),);
  }
}
