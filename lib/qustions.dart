class Question {
  String qimage = "";
  String qtext = "";
  bool qans = true;

  Question({String i="",String x="", bool a=true}) {
    qimage =i;
    qtext =x;
    qans = a;
  }
}