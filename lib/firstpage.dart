import 'package:flutter/material.dart';
import 'package:mathspuzzle/model.dart';
import 'package:mathspuzzle/secondpage.dart';
import 'package:mathspuzzle/thirdpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share/share.dart';

class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  _firstpageState createState() => _firstpageState();
}
class _firstpageState extends State<firstpage> {
  int cnt = 0;
       bool isready = false;

       initPref() async {
           model.statuslist.clear();
           model.prefs = await SharedPreferences.getInstance();
           cnt = model.prefs?.getInt('cnt') ?? 0;

           for(int i=0;i<31;i++)
              {
                 String status = model.prefs!.getString("status$i") ?? "pending";
                 model.statuslist.add(status);
               }

           isready = true;
          setState(() {

             });
         }
  @override
  void initState() {
           // TODO: implement initState
           super.initState();
          initPref();
         }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Container(
              height: 100,
              margin: EdgeInsets.all(10),
              child: Text("Maths Puzzle",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.brown)),
            ),
            Expanded(
                child: Container(
                  width: double.infinity,
              margin: EdgeInsets.all(20),
              child: isready?Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return secondpage(cnt);
                          },
                        ));
                      },
                      child: Text("Continue",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white))),
                  SizedBox(height: 25,),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return thirdpage();
                          },
                        ));
                      },
                      child: Text("Puzzle",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white))),
                  SizedBox(height: 25,),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return secondpage(cnt);
                          },
                        ));
                      },
                      child: Text("Buy pro",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white))),

                ],
              ): Center(child: CircularProgressIndicator()),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/blackboard_main_menu.png"),fit: BoxFit.fill)),
            )),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap:() {
                          setState(() {
                            Share.share('check out my website https://example.com');
                          });
                        } ,
                        child: Container(
                          color: Colors.grey,
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.all(2),
                          child: Icon(Icons.share),
                        ),
                      ),
                      InkWell(
                        onTap:() {
                          setState(() {

                          });
                        } ,
                        child: Container(
                          color: Colors.grey,
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.all(2),
                          child: Icon(Icons.mail_outline),
                        ),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {

                      });
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 5, 0),
                      alignment: Alignment.centerRight,
                      height: 30,
                      child: Text("Privacy Policy",style: TextStyle(fontSize: 25,color: Colors.black),),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/background.jpg"),fit: BoxFit.fill)),
      ),

      ),

    );
  }

}

