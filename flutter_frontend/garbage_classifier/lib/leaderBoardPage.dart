import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './models/user.dart';


//import 'package:http/http.dart' as http;
class leaderBoardPage extends StatefulWidget {
  @override
  _leaderBoardPage createState() =>  _leaderBoardPage();
}

class _leaderBoardPage extends State<leaderBoardPage> {
  List<user> _users = List<user>();
  Future<List<user>> fetchUsers() async {
    var  web = "https://quickstart-image-rvoiadg33q-uc.a.run.app/leaderboard";
    var response = await http.get(web);
    var users = List<user>();

    if (response.statusCode==200){
      var usersJson = json.decode(response.body);
      for (var userJson in usersJson){
        users.add(user.fromJson(userJson));
      }
    }
    return users;
  }

 // final List<String> entries =
//  fetchAlbum() as List<String> ;

//  <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
//  var arr =
//  var users = new List();
  @override
  void initState(){
    fetchUsers().then((value){
      setState(() {
        _users.addAll(value);
        _users.sort((a,b){
          return a.compareTo(b);
        });
      });
    });
    print(_users);
    super.initState();
  }
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
          itemCount: _users.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.amber[colorCodes[0]],
              child: Center(child: Text(
                  '${_users[index].name}' + '\n' + '${_users[index].score}'
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