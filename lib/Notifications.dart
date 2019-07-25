import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Notify extends StatefulWidget {
  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  List list = List();
  var isLoading = false;
  var len;

  _fetchData() async {
    setState(() {
      isLoading = true;

    });
    final response =
    await http.get('http://192.168.0.108:8080/news/api/notify/get.php');
    list = json.decode(response.body) as List;
    len = list.length;

    setState(() {
      isLoading = false;
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
          centerTitle: true,
          title: new Text(
            "الاشعارات",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
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
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                        leading: Container(
                          child: Icon(
                            Icons.notifications_none,
                            color: Colors.blueGrey,
                            size: 30.0,
                          ),
                        ),
                        title: new Text(list[index]['title'],
                          style: TextStyle(
                              fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        subtitle: new Column(
                          children: <Widget>[
                            Text(list[index]['content'], style: TextStyle(color: Colors.black,fontSize:14.0 )),
                            new Row(children: <Widget>[
                              Icon(Icons.date_range, color: Colors.blueGrey,size: 12.0,),
                              Text(list[index]['date'], style: TextStyle(color: Colors.black,fontSize: 12.0)),
                            ],)

                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )));
  }

}
