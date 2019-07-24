import 'package:flutter/material.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextStyle style = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 14.0,
    color: Colors.black,
  );
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
            onPressed: () {
              print("Second text field: ${passController.text}");
            },
            child: Text("تسجيل الدخول",
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
              )
            ],
          ),
        ),
      ),
    ));
  }
}
