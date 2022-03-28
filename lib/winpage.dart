import 'package:flutter/material.dart';
import 'package:mathspuzzle/firstpage.dart';
import 'package:mathspuzzle/model.dart';
import 'package:mathspuzzle/secondpage.dart';
import 'package:mathspuzzle/thirdpage.dart';
import 'package:share/share.dart';

class winpage extends StatefulWidget {
  int cnt;
  winpage(this.cnt);



  @override
  _winpageState createState() => _winpageState();
}

class _winpageState extends State<winpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      height: 1000,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/background.jpg"),fit: BoxFit.fill)
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 40,
            child: Text("Puzzle ${widget.cnt} Completed",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.brown),),
          ),
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/trophy.png"))
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        int cnt = model.prefs?.getInt('cnt') ?? 0;
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return secondpage(cnt);
                          },
                        ));
                      });
                    },child: Text("Continue",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return firstpage();
                          },
                        ));
                      });
                    },child: Text("Main Menu",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return thirdpage();
                          },
                        ));
                      });
                    },child: Text("Buy Pro",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text("Share This Puzzle",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.brown),),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        height: 40,
                        width: 40,
                        color: Colors.grey,
                        child: InkWell(
                          onTap: () {
                            Share.share('check out my website https://example.com');
                          },
                          child: Icon(Icons.share),
                        ),

                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

