import 'qustions.dart';
class Appbrain {

  int _qnumber=0;
  List<Question> _qustionGroup =[
    Question(
      i: "images/image-1.jpg",
      x: "1",
      a:true,
    ),
    Question(
      i: "images/image-2.jpg",
      x: "2",
      a:false,
    ),
    Question(
      i: "images/image-3.jpg",
      x: "3",
      a:true,
    ),
    Question(
      i: "images/image-4.jpg",
      x: "4",
      a:false,
    ),
    Question(
      i: "images/image-5.jpg",
      x: "5",
      a:true,
    ),
    Question(
      i: "images/image-6.jpg",
      x: "6",
      a:false,
    ),
    Question(
      i: "images/image-7.jpg",
      x: "7",
      a:true,
    ),
  ];

  void nextquestion(){
    if(_qnumber < _qustionGroup.length -1)
    {
      _qnumber++;
    }
  }

  bool isFinished(){
    if(_qnumber >= _qustionGroup.length -1)
      {
        return true;
      }
    else
      {
        return false;
      }
  }

  void reset () {
    _qnumber=0;
  }

  String gettext (){
    return _qustionGroup[_qnumber].qtext;
  }
  String getimage (){
    return _qustionGroup[_qnumber].qimage;
  }
  bool getans (){
    return _qustionGroup[_qnumber].qans;
  }
}