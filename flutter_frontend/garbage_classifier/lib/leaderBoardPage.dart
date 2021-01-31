import 'package:flutter/material.dart';

class leaderBoardPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Leader Board Page')
        ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child:Text('Go back to main page'),
        )),
      );

}
}