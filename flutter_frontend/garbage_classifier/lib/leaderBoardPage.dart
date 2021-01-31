import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


//import 'package:http/http.dart' as http;

class user {
  String name;
  int score;

  user({ this.name, this.score });

  factory user.fromJson( Map<String,dynamic>  json) {
    return user(
          name:json['uid'],
          score:json['score'],
      );
  }
}

class leaderBoardPage extends StatelessWidget{

  static String  web = "https://quickstart-image-rvoiadg33q-uc.a.run.app/leaderboard";

//  static Future<http.Response> fetchAlbum() {
//    return http.get(web);
//  }

  Future<user> fetchAlbum() async {
    final response = await http.get(web);

    if(response.statusCode==200){

      print("This is working");

      return user.fromJson(jsonDecode(response.body) );

    }
    else {
      throw Exception ('Failed to load user data');
    }
  }




  final List<String> entries =
//  fetchAlbum() as List<String> ;

  <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
//  var arr =
//  var users = new List();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Leaderboard Page')
        ),
      body: Center(

        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.amber[colorCodes[0]],
              child: Center(child: Text(
                  'Name ${entries[index]}' + '\nScore ' + '${colorCodes[index]}'
              ) ),
//              child: Center(child: Text('Entry ${colorCodes[index]}')),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        )

            // BackUp
//        child: ListView( padding: const EdgeInsets.all(8),
//          children: <Widget>[
//
//
//            Container(
//              height: 50,
//              color: Colors.amber[600],
//              child: const Center(child: Text('Entry C')),
//            ),
//          ],
//        ),


      ),
      );

  }
}