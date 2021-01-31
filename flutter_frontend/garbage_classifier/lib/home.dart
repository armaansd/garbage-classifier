import 'dart:async';
import 'dart:io';
import 'auth.dart';
import 'dart:convert';
import './models/package.dart';
import './models/user.dart';
//import 'package:image/image.dart' as img_2;
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
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
      packing p = packing(_name,image,_score);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Choice(p)),
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
class Choice extends StatefulWidget {

  final packing p;
  const Choice(this.p);
 // Choice({Key key, @required this.p}) : super(key: key);
  @override
  Choices createState() =>  Choices(p);
}

class Choices extends State<Choice>{
  final packing p;
  int score;
  String id;
  File image;
  int descision;
  Choices(this.p);
  //Choices({Key key, @required this.image}) : super(key: key);
  Future<void> getScore() async{
    id = p.id;
    score = p.score;
    image = p.image;

  }
  Future<void> postScore() async{
    var url = 'https://quickstart-image-rvoiadg33q-uc.a.run.app/home';
    var body = json.encode({"id": id, "score": score});

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };
    var resp = await http.put(url,body: body, headers: headers);
    if (resp.statusCode==200){
      print("nice");
    }


  }
  Future<void> getDesc() async{
    var  web = "https://quickstart-image-rvoiadg33q-uc.a.run.app/";
    // To parse this JSON data, do
    //
    //var ud = new Adduser(email,0);
    //final sendJson = UsertoJson(ud);
    var request = new http.MultipartRequest("POST", Uri.http(web,'/home'));
    request.files.add(http.MultipartFile.fromBytes('file',await image.readAsBytes(), contentType: MediaType('image', 'jpeg')));
    var strresponse = await request.send();
    int _pred = 0;
    var response = await http.Response.fromStream(strresponse);
      if (response.statusCode == 200) {print("Uploaded!");
      var r = json.decode(response.body);
       descision =  _pred = r['pred'];
      }
    }


  bool logic1(descision){
    if (descision == 0){
      return true;
    }
    else{
      return false;
    }
  }

  bool logic2(descision1){
    if (descision1 == 1){
      return true;
    }
    else{
      return false;
    }
  }
  @override
  void initState(){
    getScore();
    getDesc();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {Navigator.of(context).pop(); },
    );


    AlertDialog alert = AlertDialog(
      title: Text("Correct!"),
      content: Text(""),
      actions: [
        okButton,
      ],
    );
    AlertDialog alert2 = AlertDialog(
      title: Text("Incorrect!"),
      content: Text(""),
      actions: [
        okButton,
      ],
    );
    return Scaffold(
        appBar:  AppBar(title: Text('Prediction time!', textAlign: TextAlign.center,),
        ),
        body: Column(
            children: <Widget> [
              Container(
        margin:  EdgeInsets.only(top:20),
        child: RaisedButton(
        onPressed: () {
          bool gets = logic1(descision);
          if (gets){
            score += 500;
            postScore();
            return alert;
          }
          else{
            score -= 500;
            postScore();
            return alert2;
          }
        }, //For now go back to home
          child:
          Text("RECYCLING", textAlign: TextAlign.center,),
        )
    ),
    Container(
    margin: EdgeInsets.only(top:20),
    child: RaisedButton(
      onPressed: () {
        bool getss = logic2(descision);
        if (getss){
          score += 500;
          postScore();
          return alert;
        }
        else{
          score -= 500;
          postScore();
          return alert2;
        }
      }, //For now go back to home
      child:
      Text("TRASH", textAlign: TextAlign.center,),
    )
    ),
    Container(
        margin:  EdgeInsets.only(top:20),
        child: RaisedButton(
          onPressed: () {Navigator.pop(context);}, //For now go back to home
          child:
          Text("HOME", textAlign: TextAlign.center,),
        )
    )]
    ));
  }
}


