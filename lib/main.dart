import 'package:flutter/material.dart';
import 'login.dart';
import 'Notifications.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
  List list = List();
  var isLoading = false;
  var len;

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response =
    await http.get('http://192.168.0.115:8080/api/articles/get.php');
     list = json.decode(response.body) as List;
      len = list.length;
      setState(() {
        isLoading = false;
        print(len);
      });

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
                Icons.account_circle,
                textDirection: TextDirection.rtl,
              ),
              onPressed: () {
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
                      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      child: Padding(
                        padding: EdgeInsets.only(top: 0.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white),
                          child:  ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                              leading: Container(
                                child: new Image(
                                  image: AssetImage('assets/1.jpg'),
                                  fit: BoxFit.fitHeight,
                                  height: 120.0,
                                  width: 100.0,
                                ),
                              ),
                              title:new Text(list[index]['title'],
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize:21.0),
                              ),
                              // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                              subtitle: new Column(
                                children: <Widget>[
                                  Text(list[index]['content'], style: TextStyle(color: Colors.black,fontSize:15.0 )),
                                  new Row(children: <Widget>[
                                    Icon(Icons.date_range, color: Colors.blueGrey,size: 15.0,),
                                    Text(list[index]['date'], style: TextStyle(color: Colors.black,fontSize: 13.0)),
                                  ],)

                                ],
                              ),
                              trailing:
                              Icon(Icons.keyboard_arrow_right, color: Colors.blueGrey, size: 30.0))
                        )
                      ));
                },
              ),
            )));
  }



}
