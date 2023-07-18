import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Appbrain appbrain=Appbrain();

void main() {
  runApp(ExamApp());
}

class ExamApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Scaffold(
       appBar: AppBar(
         title: Text("اختبار"),
         backgroundColor: Colors.grey ,
         centerTitle: true,
       ),
       backgroundColor: Colors.grey[300],
       body:Padding(
         padding: const EdgeInsets.all(20),
         child: ExamPage(),
       ),
     ),
   );
  }

}

class ExamPage extends StatefulWidget {
  @override
  _ExamPage createState() => _ExamPage();
}

class _ExamPage extends State<ExamPage> {
  List<Padding> answerresult=[];
  int rightanswers =0;

  void checkanswer (bool userpicked) {
    var correctanswer= appbrain.getans();
    if(correctanswer==userpicked)
      {
        answerresult.add(
            Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.thumb_up,color: Colors.green),
            )
        );
        rightanswers++;
      }
      else
      {
        answerresult.add(
            Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.thumb_down,color: Colors.red),
            )
        );
      }
      if(appbrain.isFinished()==true)
        {
          Alert(
            context: context,
            type: AlertType.error,
            title: "الاسألة انتهت هل تبدأ من جديد؟",
            desc: "جيد لقد انتهيت و اجبت صحيحا على $rightanswers من اصل 7",
            buttons: [
              DialogButton(
                child: Text(
                  "اعادة",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
          appbrain.reset();
          answerresult=[];
          rightanswers=0;
        }
      else
        {
          appbrain.nextquestion();
        }
  }
  @override
  Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: answerresult,
          ),
          Expanded(
            child: Column(
              children: [
                Image.asset(appbrain.getimage()),
                SizedBox(
                  height: 20,
                ),
                Text( appbrain.gettext(),
                  textAlign: TextAlign.center,
                  style:TextStyle(
                    fontSize: 24,
                  ) ,
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              elevation: 0,
                            ),
                            onPressed: (){
                             setState(() {
                               checkanswer(true);
                             });
                            },
                            child: Text("صح",style: TextStyle(fontSize: 24),),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              elevation: 0,
                            ),
                            onPressed: (){
                              setState(() {
                              checkanswer(false);
                              });
                            },
                            child: Text("خطأ",style: TextStyle(fontSize: 24),),
                          ),
                        ),
                      ],
                    ),

                ),
              ],
            ),
          ),
        ],
      );
  }
}
