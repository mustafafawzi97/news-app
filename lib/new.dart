import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';

class news extends StatefulWidget {
  news({Key key, this.title,this.content,this.image}) : super(key: key);
  final String content;
  final String title;
  final String image;

  @override
  _newsState createState() => _newsState();
}

class _newsState extends State<news> {
  Uint8List bytes;
  String z;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
     z = widget.image.replaceAll("data:image/png;base64,","");
       bytes = base64.decode(z);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: new Center(child:  new Text(
          widget.title,
          style: TextStyle(color: Colors.white, fontSize: 26.0,), textAlign: TextAlign.left,
        ),)
    ),
      body:new SingleChildScrollView(child: new Column(children: <Widget>[
        new Image.memory(bytes,height: 300.0,width: 500.0,fit: BoxFit.cover,),
        new Padding(padding: EdgeInsets.only(top: 15.0,left: 15.0,right: 15.0),child:  new Text(widget.content,textAlign: TextAlign.right
          ,textDirection: TextDirection.rtl
          ,style:TextStyle(color: Colors.black54,fontSize: 22.0,) ,),
        )
    ],),),
    );
  }
}
