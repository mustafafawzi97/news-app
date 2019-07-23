import 'package:flutter/material.dart';
import 'new.dart';
import 'login.dart';
import 'Notifications.dart';

void main() => runApp(new MyApp());



class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
      primarySwatch: Colors.blue,
    ),
      home: new MyHomePage(title: 'الأخبار'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: Colors.blue[300],

          leading:  IconButton(

            icon: Icon(Icons.account_circle,textDirection: TextDirection.rtl,),
            onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
            },
          ),

          actions: <Widget>[

              // action button

            IconButton(

              icon: Icon(Icons.notifications,textDirection: TextDirection.rtl,),
              onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Notify()),
                );
              },
            ),
          ],
            centerTitle: true,

          title: new Center(child:  new Text(
            widget.title,
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

        child:  new Image(image: AssetImage('assets/1.jpg'),height: 400.0,width: 110.0,),
      ),
      title: Text(
        "نيمار يستقبل رسالة سلبية من برشلونة يواصل مسؤولو برشلونة، فرض حالة من الغموض حول مدى جديتهم في إعادة ",
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
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));
}






