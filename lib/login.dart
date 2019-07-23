import 'package:flutter/material.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0,color: Colors.black,);
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final emailField = TextField(
      obscureText: false,
      controller: emailController,
      style: style,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          hintText: "البريد الالكتروني",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
    );
    final passwordField = TextFormField(

      obscureText: true,
      controller: passController,
      style: style,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          hintText: "كلمة المرور",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blue[300],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        onPressed: () {
          print("Second text field: ${passController.text}");
        },
        child: Text("تسجيل الدخول",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.blue[300],
          centerTitle: true,
          title: new Center(child:  new Text(
            "تسجيل الدخول",
            style: TextStyle(color: Colors.white, fontSize: 24.0,), textAlign: TextAlign.left,
          ),)
      ),
      body:new SingleChildScrollView(child: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top:30.0 , right: 50.0,left: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 130.0,
                  child: Image.asset(
                    "assets/3.png",
                    fit: BoxFit.contain,
                  ),
                ),
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
                child: new Text("ليس لديك حساب ؟ انشاء حساب",style: TextStyle(fontSize: 20.0,color: Colors.black45),),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()),
            )
          ,
            )
              ],
            ),
          ),
        ),
      ),
      )
    );
  }
}

