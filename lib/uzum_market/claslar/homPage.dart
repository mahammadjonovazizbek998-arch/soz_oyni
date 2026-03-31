import 'package:flutter/material.dart';
import 'package:oyinlar/uzum_market/listlar/map.dart';

class HomPage extends StatefulWidget {
  const HomPage({super.key});

  @override
  State<HomPage> createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Container(
              width: 100,height: 100,color: Colors.red,
            ),
            Container(
              width: 700,
              height: 810,
              color: Colors.black,
              /*child: SingleChildScrollView(
                child: Column(
                  children: [
                    GridView.builder(
                      itemCount: list1.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 170,
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    list1[index]["rasim"].toString(),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Column(children: [

                              ],)
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),*/
            ),
          ],
        ),
      ),
    );
  }
}
