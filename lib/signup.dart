import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;





class Signup extends StatefulWidget {
  Signup({Key key}) : super(key: key);
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  String message = "x";

  TextStyle style = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 14.0,
    color: Colors.black,
  );
  createPost(String url, Map jsonMap) async {
    return http
        .post(url, body: utf8.encode(json.encode(jsonMap)))
        .then((http.Response response) {
      if (response.statusCode == 201) {
        print("DONE!");
        setState(() {
          message ="signup";
          emailController.text ="";
          nameController.text ="";
          passController.text ="";
        });
      } else {
        print("ERROR!");
        setState(() {
          message ="error";
        });
      }
      print(response.body);
    });
  }

  static final CREATE_POST_URL =
      'http://192.168.0.108:8080/news/api/register.php';
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
          keyboardType: TextInputType.text,
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
          keyboardType: TextInputType.text,
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
              Map map = {
                'data': {
                  'fullname': nameController.text,
                  'email': emailController.text,
                  'password': passController.text,
                  'is_admin': '0'
                }
              };
              createPost(CREATE_POST_URL, map);
            },
            child: Text("انشاء حساب",
                textAlign: TextAlign.center,
                style: style.copyWith(color: Colors.white)),
          ),
        ));

    return Scaffold(backgroundColor:Colors.white,
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
                  fit: BoxFit.fill,
                  width:600.0 ,
                ),
              ),
              nameField,
              SizedBox(height: 20.0),
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
              ),
              message == "signup"
              ? new Text(
                "تم التسجيل بنجاح",
                style: TextStyle(fontSize: 16.0, color: Colors.black45),
              )
                  :  message == "error"
        ? new Text(
                " خطأ في المعلومات",
                style: TextStyle(fontSize: 16.0, color: Colors.black45),
              )
                  :new Text(
                "",
                style: TextStyle(fontSize: 16.0, color: Colors.black45),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
