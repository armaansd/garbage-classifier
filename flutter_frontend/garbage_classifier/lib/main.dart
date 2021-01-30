import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';


void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>  _MyAppState ();

}

class _MyAppState extends State<MyApp> {
  // Set default `_initialized` and `_error` state to false
  /*
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire

  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

   */
  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    /*
    if(_error) {
      return MaterialApp(
        home: Scaffold(
          body: Text("Firebase failed to load.")
        )
      );
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return MaterialApp(
          home: Scaffold(
              body: Text("Loading... Please be patient :)")
          )
      );
    }

     */
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
      ]

    ),

    //floatingActionButton: new FloatingActionButton(onPressed: getImage,tooltip: 'Pick Image',child: new Icon(Icons.camera) ,),
        floatingActionButton: new FloatingActionButton(tooltip: 'Pick Image',child: new Icon(Icons.camera) ,),
  ),);
  }

}