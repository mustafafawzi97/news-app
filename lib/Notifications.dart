import 'package:flutter/material.dart';

class Notify extends StatefulWidget {
  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
            backgroundColor: Colors.blue[300],
            centerTitle: true,
            title: new Center(child:  new Text(
              "الاشعارات",
              style: TextStyle(color: Colors.white, fontSize: 27.0,), textAlign: TextAlign.center,
            ),)
        ),


        body:new Directionality(textDirection: TextDirection.rtl, child:  Container(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return makeCard;
            },
          ),
        )
        )
    );
  }
  final makeCard = Card(
      elevation: 8.0,

      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Padding(padding: EdgeInsets.only(top: 0.0),child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: makeListTile,
      ),)
  );

  static final  makeListTile = ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      leading: Container(

        child:   Icon(Icons.notifications, color: Colors.blue[300],size: 50.0,),
      ),
      title: Text(
        "نيمار يستقبل رسالة سلبية من برشلونة",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Icon(Icons.date_range, color: Colors.blue[300]),
          Text(" 10/2/2019", style: TextStyle(color: Colors.black))
        ],
      ),
      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.blue[300], size: 30.0));
}

