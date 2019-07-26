import 'package:flutter/material.dart';
import 'login.dart';
import 'Notifications.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'new.dart';
import 'dart:typed_data';
import 'package:shared_preferences/shared_preferences.dart';
import 'splash.dart';

void main() => runApp(new MyApp());



class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'news',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        fontFamily: 'Cairo',
      ),
      home: new Splash(),
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

  List<Uint8List> image = List();
  List content = List();
  List list = List();
  var isLoading = false;
    var len;
    Uint8List bytes;


  setlogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', 0);
  }

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response =
    await http.get('http://192.168.0.113:8080/news/api/articles/get.php');
     list = json.decode(response.body) as List;
      len = list.length;

      setState(() {
        isLoading = false;
        getimage();
      });

  }


  getimage() {
    String z;
    String y;
    for(int i=0;i<len;i++){
      z=list[i]['image'];
      y = z.replaceAll("data:image/png;base64,","");
      bytes = base64.decode(y);
      image.add(bytes);
    }
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
            backgroundColor: Colors.blueGrey,
            leading: IconButton(
              icon: Icon(
                Icons.exit_to_app,

                textDirection: TextDirection.rtl,
              ),
              onPressed: () {
                setlogout();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
            actions: <Widget>[
              // action button
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  textDirection: TextDirection.rtl,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Notify()),
                  );
                },
              ),
            ],
            centerTitle: true,
            title: new Center(
              child: new Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
                textAlign: TextAlign.center,
              ),
            )),

        body: isLoading
            ? Center(
          child: CircularProgressIndicator(backgroundColor:Colors.blueGrey),
        )
            : new Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              child: ListView.builder(

                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: len,
                itemBuilder: (BuildContext context, int index) {

                    return Card(
                        elevation: 8.0,
                        margin: new EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Padding(
                            padding: EdgeInsets.only(top: 0.0),
                            child: Container(
                                decoration: BoxDecoration(color: Colors.white),
                                child: ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 20.0),
                                  leading: Container(
                                    child: new Image.memory(image[index],fit: BoxFit.fitHeight,
                                      height: 120.0,
                                      width: 100.0,),
                                  ),
                                  title: new Text(list[index]['title'].substring(0,15),
                                    style: TextStyle(color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21.0),
                                  ),
                                  subtitle: new Column(
                                    children: <Widget>[
                                      Text((list[index]['content']).substring(0,51),
                                          style: TextStyle(color: Colors.black,
                                              fontSize: 15.0)),
                                      new Row(children: <Widget>[
                                        Icon(Icons.date_range,
                                          color: Colors.blueGrey, size: 15.0,),
                                        Text(list[index]['date'],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13.0)),
                                      ],)

                                    ],
                                  ),
                                  trailing:
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      textDirection: TextDirection.rtl,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>
                                            news(title: list[index]['title'],
                                              content: list[index]['content'],
                                              image: list[index]['image'],)),
                                      );
                                    },
                                  ),


                                )
                            )
                        ));
                  },
              ),
            )));
  }



}
