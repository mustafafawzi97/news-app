import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class data {

  final String name;
  final String email;
  final String pass;
  final String admin;

  data({this.name, this.email, this.pass,this.admin});

  factory data.fromJson(Map<String, dynamic> json) {
    return data(
      name: json['fullname'],
      email: json['email'],
      pass: json['password'],
      admin: json['is_admin'],

    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["fullname"] = name;
    map["email"] = email;
    map["password"] = pass;
    map["is_admin"] = admin;
    return map;
  }
}

Future<data> createPost(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;
    print(response.body);
    return data.fromJson(json.decode(response.body));

  });
}

class Signup extends StatefulWidget {
  final Future<data> post;
  Signup({Key key, this.post}) : super(key: key);
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {


  TextStyle style = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 14.0,
    color: Colors.black,
  );
  static final CREATE_POST_URL = 'http://192.168.0.115:8080/api/register.php';
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final nameField = Padding(
        padding: const EdgeInsets.only(top: 60.0, right: 15.0, left: 15.0),
        child: TextField(
          obscureText: false,
          controller: nameController,
          style: style,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            hintText: "اسم المستخدم",
          ),
        ));
    final emailField = Padding(
        padding: const EdgeInsets.only(right: 15.0, left: 15.0),
        child: TextField(
          obscureText: false,
          controller: emailController,
          style: style,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            hintText: "البريد الالكتروني",
          ),
        ));
    final passwordField = Padding(
        padding: const EdgeInsets.only(right: 15.0, left: 15.0),
        child: TextFormField(
          obscureText: true,
          controller: passController,
          style: style,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            hintText: "كلمة المرور",
          ),
        ));
    final loginButon = Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 15.0, left: 15.0),
        child: Material(
          elevation: 5.0,
          color: Colors.blueGrey,
          child: MaterialButton(
            minWidth: 150.0,
            padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            onPressed: () async {
              data newPost = new data(
                  name: nameController.text, email: emailController.text, pass: passController.text,admin: "0");
              data p = await createPost(CREATE_POST_URL,
                  body: {data  : newPost.toMap()});
              print(p.email);
            },
            child: Text("انشاء حساب",
                textAlign: TextAlign.center,
                style: style.copyWith(color: Colors.white)),
          ),
        ));

    return Scaffold(
        body: new SingleChildScrollView(
      child: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: Image.asset(
                  "assets/login.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              nameField,
              SizedBox(height: 10.0),
              emailField,
              SizedBox(height: 20.0),
              passwordField,
              SizedBox(
                height: 20.0,
              ),
              loginButon,
              SizedBox(
                height: 25.0,
              ),
              new InkWell(
                child: new Text(
                  "تسجيل دخول؟",
                  style: TextStyle(fontSize: 16.0, color: Colors.black45),
                ),
                onTap: () => Navigator.pop(
                  context,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
