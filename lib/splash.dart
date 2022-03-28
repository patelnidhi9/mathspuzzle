import 'package:flutter/material.dart';
import 'package:mathspuzzle/firstpage.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    goNext();
  }

  goNext()
  async {
    await Future.delayed(Duration(milliseconds: 500));

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return firstpage();
    },));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Math Puzzle",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50,color: Colors.brown),),
      ),
    );
  }
}
