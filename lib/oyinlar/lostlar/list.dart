import 'dart:ui';

class list{
Map<String,List<tanla1>> map1;
Map<String,List<tanla1>> map2;
String matin;
List<tanla1> tanla;
Color rang1;
Color rang2;
List<String> javob;
list({required this.map1,required this.map2,required this.matin,required this.tanla,required this.rang1,required this.rang2,required this.javob});
}
class map{
  String rasim;
  List tanla;
  map({required this.rasim,required this.tanla});
}
class tanla1{
   String tanlash1;
   String tanlash2;
   String tanlash3;
   String tanlash4;
   String tanlash5;
   String tanlash6;
  tanla1({required this.tanlash1,required this.tanlash2,this.tanlash3="a",this.tanlash4="a",this.tanlash5="a",this.tanlash6="a"});
}
