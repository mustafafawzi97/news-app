import 'package:flutter/material.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0,);
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final emailField = TextField(
      obscureText: false,
      style: style,
      controller: emailController,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          hintText: "البريد الالكتروني",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
    );
    final passwordField = TextFormField(
      obscureText: true,
      style: style,
      controller: passController,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          hintText: "كلمة المرور",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final nameField = TextField(
      obscureText: false,
      style: style,
      controller: nameController,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          hintText: "اسم المستخدم",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blue[300],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        onPressed: () {},
        child: Text("انشاء حساب",
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
              "انشاء حساب",
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
                  SizedBox(
                    height: 20.0,
                  ),
                  nameField,
                  SizedBox(
                    height: 20.0,
                  ),
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
                    child: new Text(" لديك حساب ؟  تسجيل الدخول",style: TextStyle(fontSize: 20.0,color: Colors.black45),),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Login()),
                    )
                    ,
                  ),

                ],
              ),
            ),
          ),
        ),
        )
    );
  }
}
