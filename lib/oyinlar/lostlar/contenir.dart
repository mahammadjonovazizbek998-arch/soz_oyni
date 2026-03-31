import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oyinlar/oyinlar/lostlar/list_clas.dart';
import 'package:oyinlar/oyinlar/claslar/HomePaj.dart';

class contenir extends StatelessWidget {
  Color rang;
  String rasim;
String shart;
  contenir({super.key,required this.rang,required this.rasim,required this.shart});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.black38),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(10, 10),
            blurRadius: 30,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment(1, -1),
            width: 150,
            height: 190,
            child: SizedBox(
              width: 40,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black26,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                  padding: EdgeInsets.zero,
                  minimumSize: Size(40, 40),
                ),
                onPressed: () {},
                child: Icon(Icons.search_rounded, color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius:BorderRadius.vertical(top: Radius.circular(10)),
              color: Colors.white,
             image: DecorationImage(image: AssetImage(rasim),),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 60,
              height: 20,

              child: Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color:rang,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: rang,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  if(shart!="a")...[
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color:shart=="a"? Colors.black:rang,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),]
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ),
            width: 150,
            height: 38,
            decoration: BoxDecoration( boxShadow: [
              BoxShadow(
              color: rang,
              offset: Offset(5, 5),
              blurRadius: 10,
            ),],
              color: rang,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(9),
                bottomLeft: Radius.circular(9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class dergl extends StatelessWidget {
  String matin1;
  String matin;
   dergl({super.key,required this.matin,required this.matin1});

  @override
  Widget build(BuildContext context) {
    return  Draggable<String>(data: matin1,
      feedback: Container(alignment: Alignment.center,decoration: BoxDecoration(color: Colors.indigo),
        width: 30, height: 50,child: Text(matin,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500),),),
      child: Container(alignment: Alignment.center,
        child: Text(matin),
        width: 30,
        height: 50,
        decoration: BoxDecoration(color: Colors.indigo.withOpacity(0.4),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(1, 1),
              blurRadius: 5,
            ),
          ],
        ),
      ),childWhenDragging: Container(),
    );
  }
}
class dregblTabl extends StatelessWidget {
  bool tekshi;
  String matin;
  final DragTargetAccept<String>? onAccept;
  dregblTabl({super.key,required this.matin,required this.onAccept,required this.tekshi});


  @override
  Widget build(BuildContext context) {
    return  DragTarget<String>(
        onWillAccept:(data)=>true,
        onAccept: onAccept,
        builder: (context, candidateData, rejectedData) {
      if (tekshi==true) {
        return Container(width: 30,height: 50,decoration: BoxDecoration(color: Colors.amber.withOpacity(0.6),
            border:Border.all(color: Colors.black54,width: 1)),);
      }else{
       return Container(alignment: Alignment.center,
          child: Text(matin,style: TextStyle(color: Colors.white),),
          width: 30,
          height: 50,
          decoration: BoxDecoration(color: Colors.indigo.withOpacity(0.4),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(1, 1),
                blurRadius: 5,
              ),
            ],
          ),
        );
      }
    });
  }
}


