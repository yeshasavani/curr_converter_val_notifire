import 'package:currency_conveter_valunotifire/second.dart';
import 'package:flutter/material.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  void initState(){
    super.initState();
    gonext();
  }

  gonext() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return second();
    },));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("image/currency.jpg"))
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Text("currency Converter",style: TextStyle(color: Colors.teal,fontSize: 30))),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Text("Instantly convert currency by using",style: TextStyle(color: Colors.white,fontSize: 20))),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Text("live Exchange Rates",style: TextStyle(color: Colors.white,fontSize: 20)))
          ],
        ),
      ),
    );
  }
}