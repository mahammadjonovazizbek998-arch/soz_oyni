import 'package:flutter/material.dart';
import 'package:oyinlar/puzzles/listlar/list.dart';
import 'package:oyinlar/puzzles/listlar/listalr.dart';

class Sahifa extends StatefulWidget {
  const Sahifa({super.key});

  @override
  State<Sahifa> createState() => _SahifaState();
}

class _SahifaState extends State<Sahifa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text(
          "Puzzles",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 140,
                width: 200,
                child: Image.asset(
                  "astes/puzzles/fon/landscapes-of-nature-oil-08.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 80),
                    child: Container(
                      width: 330,
                      height: 330,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.brown, width: 2),
                      ),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: joylanganlar.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                        ),
                        itemBuilder: (context, index) {
                          return DragTarget<Model>(
                            onWillAcceptWithDetails:
                                (DragTargetDetails<Model> detels) {
                                  if (joylanganlar[index] == null) {
                                    return true;
                                  } else {
                                    return false;
                                  }
                                },
                            onAcceptWithDetails:
                                (DragTargetDetails<Model> detels) {
                                  setState(() {
                                    if (index == detels.data.data) {
                                      joylanganlar[index] = detels.data;
                                      // Puzles_elmenti.remove(detels.data);
                                      int topiladimPuzles =
                                          Puzles_elmenti.indexWhere(
                                            (elment) => elment == detels.data,
                                          );
                                      if (topiladimPuzles != -1) {
                                        Puzles_elmenti.removeAt(
                                          topiladimPuzles,
                                        );
                                      }
                                      int topildimiIndex = hatolok.indexWhere(
                                        (elment) => elment.model == detels.data,
                                      );
                                      if (topildimiIndex != -1) {
                                        hatolok.removeAt(topildimiIndex);
                                      }
                                    } else {
                                      int topildimiIndex = hatolok.indexWhere(
                                        (elment) => elment.model == detels.data,
                                      );
                                      if (topildimiIndex != -1) {
                                        hatolok[topildimiIndex].width =
                                            detels.offset.dx;
                                        hatolok[topildimiIndex].height =
                                            detels.offset.dy;
                                        Puzles_elmenti.remove(detels.data);
                                      } else {
                                        Qushimcha qushimcha = Qushimcha(
                                          model: detels.data,
                                          height: detels.offset.dy,
                                          width: detels.offset.dx,
                                        );
                                        hatolok.add(qushimcha);
                                        Puzles_elmenti.remove(detels.data);
                                      }
                                    }
                                    if (joylanganlar.every((n) => n != null)) {
                                      bool tekshir = true;
                                      for (
                                        int i = 0;
                                        i < joylanganlar.length;
                                        i++
                                      ) {
                                        if (joylanganlar[i]!.data != i) {
                                          tekshir = false;
                                        }
                                      }
                                      if (tekshir == true) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text("Tabriklayman"),
                                            duration: Duration(seconds: 5),
                                            backgroundColor: Colors.blue,
                                          ),
                                        );
                                        for (
                                          int i = 0;
                                          i < joylanganlar.length;
                                          i++
                                        ) {
                                          Puzles_elmenti.add(joylanganlar[i]!);
                                          joylanganlar[i] = null;
                                        }
                                      } else {
                                        for (
                                          int i = 0;
                                          i < joylanganlar.length;
                                          i++
                                        ) {
                                          Puzles_elmenti.add(joylanganlar[i]!);
                                          joylanganlar[i] = null;
                                        }
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text("xatolik yuberdi"),
                                            duration: Duration(seconds: 5),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                    }
                                  });
                                }, //ishlaydi
                            builder: (context, candidateData, rejectedData) {
                              if (joylanganlar[index] == null) {
                                return Container(
                                  width: 80,
                                  height: 80,
                                  child: Icon(Icons.add),
                                );
                              } else {
                                return Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        joylanganlar[index]!.rasim,
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Puzles_elmenti.length,
                  itemBuilder: (context, index) {
                    return LongPressDraggable<Model>(
                      data: Puzles_elmenti[index],
                      feedback: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Puzles_elmenti[index].rasim),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      childWhenDragging: SizedBox(width: 0, height: 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(Puzles_elmenti[index].rasim),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ), //ishlaydi
            ],
          ),
          for (var xato in hatolok) //ishlaydi
            Positioned(
              top: xato.height - 80,
              left: xato.width,
              child: LongPressDraggable<Model>(
                data: xato.model,

                childWhenDragging: SizedBox(),
                feedback: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(xato.model.rasim),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(xato.model.rasim),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
