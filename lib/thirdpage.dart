import 'package:flutter/material.dart';
import 'package:mathspuzzle/model.dart';
import 'package:mathspuzzle/secondpage.dart';

class thirdpage extends StatefulWidget {
  const thirdpage({Key? key}) : super(key: key);

  @override
  _thirdpageState createState() => _thirdpageState();
}

class _thirdpageState extends State<thirdpage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/background.jpg"),fit: BoxFit.fill,)
        ),
        child: Column(
          children: [
            Container(
              child: Text("Select Puzzle",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color:Colors.brown),),
            ),
            Container(
              height: 600,
              width: double.infinity,
              child: GridView.builder(itemCount:30,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
                itemBuilder: (context, index) {
                  String status = model.statuslist[index];
                  int cnt = model.prefs!.getInt("cnt") ?? 0;
                  if (status == "clear") {
                                   return InkWell(
                                         onTap: () {
                                         Navigator.push(context, MaterialPageRoute(
                                              builder: (context) {
                                             return secondpage(index); // 0
                                           },));
                                   },
                                   child: Container(
                                     child: Text("${index + 1}"),
                                     alignment: Alignment.center,
                                     decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage("images/tick.png"))
                                     ),
                                  ),
                                 );
                               } else if (status == "skip") {
                                 return InkWell(
                                   onTap: () {
                                     Navigator.push(context, MaterialPageRoute(
                                       builder: (context) {
                                         return secondpage(index); // 0
                                       },
                                     ));
                                   },
                                   child: Container(
                                     alignment: Alignment.center,
                                     child: Text("${index + 1}"),
                                   ),
                                 );
                               } else {
                                 if (index == cnt) {
                                   return InkWell(
                                     onTap: () {
                                       Navigator.push(context, MaterialPageRoute(
                                         builder: (context) {
                                           return secondpage(index); // 0
                                         },
                                      ));
                                    },
                                     child: Container(
                                       alignment: Alignment.center,
                                       child: Text("${index + 1}"),
                                       // decoration: BoxDecoration(
                                       //     image: DecorationImage(image: AssetImage("images/lock.png"))
                                       // ),
                                     ),
                                   );
                                 } else{
                                   return Container(
                                         alignment: Alignment.center,
                                         decoration: BoxDecoration(
                                                image: DecorationImage(image: AssetImage("images/lock.png"))
                                            ),
                                       );

                                   // return Container(
                                   //    decoration: BoxDecoration(
                                   //        image: DecorationImage(image: AssetImage("images/lock.png"))
                                   //    ),
                                   //   alignment: Alignment.center,
                                   // );
                                 }
                               }
                  },),
            ),
            Container(
              // alignment: Alignment.centerRight,
              // child: InkWell(
              //   onTap: () {
              //   Navigator.push(context, MaterialPageRoute(builder: (context) {
              //     return secondpage(index);
              //   },));
              //   },
                child: Container(
                  margin: EdgeInsets.all(80),
                  width: 60,
                  height: 60,

                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("images/next.png"))
                  ),
                ),

              ),
             // ),
          ],
        ),
      ),

    );
  }
}

