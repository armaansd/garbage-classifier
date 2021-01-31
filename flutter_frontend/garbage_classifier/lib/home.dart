import 'dart:async';
import 'dart:io';
import 'auth.dart';
import 'dart:convert';
import './models/user.dart';
//import 'package:image/image.dart' as img_2;
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'leaderBoardPage.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;


//https://quickstart-image-rvoiadg33q-uc.a.run.app/leaderboard
/*
Future<void> main(){
  WidgetsFlutterBinding.ensureInitialized();
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
*/
class Home extends StatefulWidget {
  @override
  MyHome createState() =>  MyHome();
}

//class _MyAppState extends State<MyApp> {
class MyHome extends State<Home>{
  File _image;
  String _name = "";
  int _score = 0;
  @override
  void initState(){
    fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    return MaterialApp(theme:
    ThemeData(brightness: Brightness.dark,
        primaryColor:Colors.blueGrey),
      home:
      Scaffold(
        appBar:  AppBar(title: Text('Garbify', textAlign: TextAlign.center,),
        ),
        body: Column(
            children: <Widget> [Container(
                margin:  EdgeInsets.only(top:50),
                child: Center(
                    child: Image(image: AssetImage('test_imgs/litter.jpg'))
                )
            ),
              Container(
                  margin: EdgeInsets.only(top:10),
                  child: Center(
                    child: Text(_name,textAlign:TextAlign.center,),
                  )
              ),
              Container(
                  margin: EdgeInsets.only(top:10),
                  child: Center(
                    child: Text( _score.toString() ,textAlign:TextAlign.center,),
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
              Container(
                alignment:Alignment.bottomCenter,
                  child:
                  RaisedButton(
                    onPressed: () {
                      context.read<AuthenticationService>().signOut();
                    },
                    child: Text("Sign out"),
              )
              )]
        ),

        floatingActionButton: new FloatingActionButton(onPressed:
            getImage,
        tooltip: 'Pick Image',child: new Icon(Icons.camera) ,),
      ),);
  }

  Future<File> getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera,maxHeight: 480, maxWidth: 640);
    setState(() {
      _image = image;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Choices( image: _image)),
      );
    });
  }
  Future<user> fetchUser() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User userd = auth.currentUser;
    final uid = userd.email.toString();
    var  web = "https://quickstart-image-rvoiadg33q-uc.a.run.app/home";
    var queryParameters = {
      'id': uid,
    };
    String queryString = Uri(queryParameters: queryParameters).query;
    var requestUrl = web + '?' + queryString; // result - https://www.myurl.com/api/v1/user?param1=1&param2=2
    var response = await http.get(requestUrl);
    if (response.statusCode==200){
      print("success");
      var userJson = json.decode(response.body);
      var uu = user.fromJson(userJson);
      setState(() {
        _name = uu.name;
        _score = uu.score;
      });
    }
  }
}

class Choices extends StatelessWidget{
  final File image;

  Choices({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
        appBar:  AppBar(title: Text('Prediction time!', textAlign: TextAlign.center,),
        ),
        body: Column(
            children: <Widget> [Container(
                margin:  EdgeInsets.only(top:20),
                child: Center(
                    child: Text("PLACEHOLDER")//Image.file(image)
                )
            ),
              Container(
        margin:  EdgeInsets.only(top:20),
        child: RaisedButton(
        onPressed: () {Navigator.pop(context);}, //For now go back to home
          child:
          Text("RECYCLING", textAlign: TextAlign.center,),
        )
    ),
    Container(
    margin: EdgeInsets.only(top:20),
    child: RaisedButton(
      onPressed: () {Navigator.pop(context);}, //For now go back to home
      child:
      Text("TRASH", textAlign: TextAlign.center,),
    )
    ),
    Container(
    margin:EdgeInsets.only(top:50),
    child: TextField()
    )]
    ));
  }
}


