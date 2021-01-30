import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


void main() => runApp(new MyApp ());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _MyAppState ();

}

class _MyAppState extends State<MyApp> {
  File _image;

  Future getImage() async {
    var image  = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
  return new MaterialApp(title: 'Image Picker',
  home: new Scaffold(
    appBar: new AppBar(title: new Text('Image Picker'),
    ),
    body: new Center(child: _image == null? new Text('No image selected'):new Image.file(_image),
    ),
    floatingActionButton: new FloatingActionButton(onPressed: getImage,tooltip: 'Pick Image',child: new Icon(Icons.camera) ,),
  ),);
  }

}