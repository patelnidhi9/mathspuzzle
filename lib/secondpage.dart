import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mathspuzzle/firstpage.dart';
import 'package:mathspuzzle/model.dart';
import 'package:mathspuzzle/thirdpage.dart';
import 'package:mathspuzzle/winpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class secondpage extends StatefulWidget {
  int cnt;
  secondpage(this.cnt);

  @override
  _secondpageState createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {

  String userans = "";
  List<String> answerlist = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"];
   @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                     InkWell(
                onTap: () {
                  model.statuslist[widget.cnt] = "skip";
                  model.prefs!.setString("status${widget.cnt}", "skip");
                  widget.cnt++;
                  model.prefs!.setInt("cnt", widget.cnt);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return secondpage(widget.cnt);
                    },));
                },
            child: Image.asset(
              "images/skip.png",
              height: 50,
              width: 50,
              alignment: Alignment.center,
            ),
            ),
                    Expanded(
                        child: Row(
                          children: [
                            Expanded(child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage("images/level_board.png"),fit: BoxFit.fill)
                              ),
                              margin: EdgeInsets.all(20),
                              alignment: Alignment.center,
                              height: 60,
                              width: 200,
                              child: Text("Puzzle ${widget.cnt+1}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                            ),)
                          ],

                        )),
                    Image.asset(
                      "images/hint.png",
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
                Expanded(child: Container(
                  alignment: Alignment.center,
                  //child: Image.asset("images/p${widget.cnt+1}.png"),
                  child: Image.asset("${model.image[widget.cnt+1]}"),
                )),
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.black,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          color: Colors.white,
                          child: Text(userans),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if(userans.length>0)
                              {
                                userans = userans.substring(0, userans.length-1);
                              }
                            });
                          },
                          icon: Icon(
                            Icons.clear,
                            color: Colors.white,
                          )),
                      TextButton(onPressed: () {
                        String correctans = answerlist[widget.cnt];

                        if(userans==correctans)
                        {
                          String status = model.statuslist[widget.cnt];
                          if(status=="pending")
                          {
                            model.statuslist[widget.cnt] = "clear";
                            model.prefs!.setString("status${widget.cnt}", "clear");

                            widget.cnt++;

                            model.prefs!.setInt("cnt", widget.cnt);

                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                              return winpage(widget.cnt);
                              },));
                          }
                          else if(status=="skip")
                          {
                            model.statuslist[widget.cnt] = "clear";
                            model.prefs!.setString("status${widget.cnt}", "clear");

                            widget.cnt++;

                            // model.prefs!.setInt("cnt", widget.cnt);

                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                              return winpage(widget.cnt);
                            },));

                          }
                          else if(status=="clear")
                          {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                              return thirdpage();
                            }
                            ));
                          }
                        }
                        else
                        {
                          Fluttertoast.showToast(
                              msg: "wrong!!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER   ,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }

                      }, child: Text("Submit",style: TextStyle(fontSize: 20,color: Colors.white),)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  color: Colors.black,
                  child: Row(
                    children: allButton(),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/gameplaybackground.jpg"),
                    fit: BoxFit.fill)),
          )),

    ), onWillPop: goBack);
  }
  Future<bool> goBack()
  {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return firstpage();
      },
    ));
    return Future.value();
  }

  List<Widget> allButton()
  {
    List<Widget> list = [];

    for(int i=0;i<10;i++)
      {
        list.add(Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  userans = "$userans$i";
                });
              },
              child: Container(
                height: 40,
                child: Text("${i}",style: TextStyle(fontSize: 20,color: Colors.black),),
                color: Colors.grey,
                margin: EdgeInsets.all(2),
              ),
            )));
      }
    return list;
  }
}
