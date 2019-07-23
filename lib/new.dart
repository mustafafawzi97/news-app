import 'package:flutter/material.dart';

class news extends StatefulWidget {
  @override
  _newsState createState() => _newsState();
}

class _newsState extends State<news> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue[300],
        centerTitle: true,
        title: new Center(child:  new Text(
          "الاخبار",
          style: TextStyle(color: Colors.white, fontSize: 26.0,), textAlign: TextAlign.left,
        ),)
    ),
      body:new SingleChildScrollView(child: new Column(children: <Widget>[


       new Image(image:  AssetImage('assets/1.jpg'),fit: BoxFit.fitWidth,width: 412.0,height: 310.0,) ,
        new Padding(padding: EdgeInsets.only(top: 15.0,left: 15.0,right: 15.0),child:  new Text("أعلنت بريطانيا "
            "انضمامها لحرب الساحل والصحراء في مالي، حيث تقاتل"
            " قواتبرخ الفرنسية إلى جانبوأوضح البيان أالجنود البريطانيين سيعملون إلى جانب قوات من أكثر"
            " من 30 بلداً، وسيوفّرون قدرات استطلاعية طويلة المدى، ومزيداً من القدرات على رصد التهديدات "
            "وسيساهمون في حماية المدنيين وأكدت الوزارة أن هذه المساهمة ستكتمل بحضور ضباط بريطانيين "
            "في مقرات قيادة مهمة الأمم المتحدة وبرامج تدريب جديدةوفي بداية يوليو، أعلنت لندن تمديد"
            " مشاركتها العسكرية في مالي لستة أشهر دعماً لقوة برخان الفرنسية ضد الإرهابيين.",textAlign: TextAlign.right
          ,textDirection: TextDirection.rtl
          ,style:TextStyle(color: Colors.black54,fontSize: 22.0,) ,),
        )
    ],),),
    );
  }
}
