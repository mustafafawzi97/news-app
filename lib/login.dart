import 'package:flutter/material.dart';
import 'signup.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart';






class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String message = "x";

  TextStyle style = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 14.0,
    color: Colors.black,
  );

  setlogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', 1);
  }

  createPost(String url, Map jsonMap) async {
    return http
        .post(url, body: utf8.encode(json.encode(jsonMap)))
        .then((http.Response response) {
      if (response.statusCode == 201) {
        print("DONE!");
        setState(() {
          setlogin();
          message ="login";
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage(title: "الاخبار",)),
          );
        });
      } else {
        setState(() {
          message ="error";
        });

        print("ERROR!");
      }
      print(response.body);
    });
  }

  static final CREATE_POST_URL = 'http://192.168.1.18:8080/news/api/login.php';
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = Padding(
        padding: const EdgeInsets.only(top: 60.0, right: 15.0, left: 15.0),
        child: TextField(
          obscureText: false,
          controller: emailController,
          style: style,
          textAlign: TextAlign.right,
          keyboardType: TextInputType.emailAddress,
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
          keyboardType: TextInputType.text,
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
              var bytes = utf8.encode(passController.text); // data being hashed
              var digest = sha1.convert(bytes);
              Map map = {
                'data': {
                  'email': emailController.text,
                  'password': digest.toString(),
                }
              };
              createPost(CREATE_POST_URL, map);


            },
            child: Text("تسجيل الدخول",
                textAlign: TextAlign.center,
                style: style.copyWith(color: Colors.white)),
          ),
        ));

    return Scaffold(backgroundColor: Colors.white,
        body: new SingleChildScrollView(
      child: Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: Image.asset(
                  "assets/login.png",
                  fit: BoxFit.fill,
                  width:600.0 ,

                ),
              ),
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
                  "انشاء حساب؟",
                  style: TextStyle(fontSize: 16.0, color: Colors.black45),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
                ),
              ),
              message == "error"
                  ? new Text(
                "خطأ في المعلومات",
                style: TextStyle(fontSize: 16.0, color: Colors.black45),
              )
                  :
                   new Text(
                "",
                style: TextStyle(fontSize: 16.0, color: Colors.black45),
              )
            ],
          ),
        ),
      ),
    );
  }
}
