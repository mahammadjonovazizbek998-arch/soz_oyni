import 'package:flutter/material.dart';
import 'package:oyinlar/oyinlar/lostlar/contenir.dart';
import 'package:oyinlar/oyinlar/lostlar/list_clas.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  int bal = 0;
  bool shart1=false;
  Map<int, String> qiymat = {};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        endDrawer: Drawer(),
        appBar: AppBar(
          title: Center(
            child: Container(
              width: 120,
              height: 40,
              padding: EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 30),
                  SizedBox(width: 15),
                  Text(
                    bal.toString(),
                    style: TextStyle(color: Colors.black87, fontSize: 18),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          leading: Container(
            width: 40,
            height: 60,
            child: Column(
              children: [
                Text("LEVEL", style: TextStyle(fontSize: 16)),
                Text(
                  (index + 1).toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          toolbarHeight: 80,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                contenir(
                  rang: oyna[index].rang1,
                  rasim: oyna[index].map1.keys.first,
                  shart: oyna[index].map1.values.first[0].tanlash3,
                ),
                SizedBox(width: 20),
                contenir(
                  rang: oyna[index].rang2,
                  rasim: oyna[index].map2.keys.first,
                  shart: oyna[index].map2.values.first[0].tanlash3,
                ),
              ],
            ),
            SizedBox(height: 50),
            Container(
              width: 370,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.indigo.withOpacity(0.6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(5, 5),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Text(
                oyna[index].matin,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              alignment: Alignment.center,
            ),
            SizedBox(height: 5),
            Container(
              width: 370,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.indigo.withOpacity(0.6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(5, 5),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(oyna[index].javob.length, (i) {
                  if (oyna[index].javob[i].isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),

                      child:
                      dregblTabl(
                        matin: qiymat[i] ?? "",

                        onAccept: (String data) {
                          setState(() {
                            qiymat[i] = data;
                            if (oyna[index].javob.length == qiymat.length) {
                              shart1=true;

                            for(int i=0; i<oyna[index].javob.length;i++){
                              if(oyna[index].javob[i]!=qiymat[i]){qiymat.clear();
                                shart1=false;
                                break;
                              }
                            }
                            if(shart1==true){
                              qiymat.clear();
                              bal+=200;
                              if(index<oyna.length-1){
                                index+=1;
                              }else{
                                index=0;
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Tabriklaymiz siz o'ynda yutdingiz"),backgroundColor: Colors.blue,));
                              }
                            } }
                          });
                        },

                        tekshi: qiymat[i] == null,
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                }),
              ),
              alignment: Alignment.center,
            ),
            Container(
              width: 370,
              height: 100,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (oyna[index].tanla[0].tanlash1 != "a") ...[
                    dergl(
                      matin: oyna[index].tanla[0].tanlash1,
                      matin1: oyna[index].tanla[0].tanlash1,
                    ),
                    SizedBox(width: 10),
                  ],
                  if (oyna[index].tanla[0].tanlash2 != "a") ...[
                    dergl(
                      matin: oyna[index].tanla[0].tanlash2,
                      matin1: oyna[index].tanla[0].tanlash2,
                    ),
                    SizedBox(width: 10),
                  ],
                  if (oyna[index].tanla[0].tanlash3 != "a") ...[
                    dergl(
                      matin: oyna[index].tanla[0].tanlash3,
                      matin1: oyna[index].tanla[0].tanlash3,
                    ),
                    SizedBox(width: 10),
                  ],
                  if (oyna[index].tanla[0].tanlash4 != "a") ...[
                    dergl(
                      matin: oyna[index].tanla[0].tanlash4,
                      matin1: oyna[index].tanla[0].tanlash4,
                    ),
                    SizedBox(width: 10),
                  ],
                  if (oyna[index].tanla[0].tanlash5 != "a") ...[
                    dergl(
                      matin: oyna[index].tanla[0].tanlash5,
                      matin1: oyna[index].tanla[0].tanlash5,
                    ),
                    SizedBox(width: 10),
                  ],
                  if (oyna[index].tanla[0].tanlash6 != "a") ...[
                    dergl(
                      matin: oyna[index].tanla[0].tanlash6,
                      matin1: oyna[index].tanla[0].tanlash6,
                    ),
                    SizedBox(width: 10),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
