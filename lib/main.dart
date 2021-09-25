import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String image_name1 ='assets/images/dice1.png';
  String image_name2 ='assets/images/dice1.png';
  Random rnd = new Random();
  dynamic ListImage = [
    "assets/images/dice1.png",
    "assets/images/dice2.png",
    "assets/images/dice3.png",
    "assets/images/dice4.png",
    "assets/images/dice5.png",
    "assets/images/dice6.png",
    "assets/images/diceeLogo.png"
  ];
  @override
  
  Image img(){
    int min = 0;
    int max = ListImage.length-1;
    int r = min + rnd.nextInt(max - min);
    int d = min + rnd.nextInt(max -min);
    image_name1  = ListImage[r].toString();
    image_name2 = ListImage[d].toString();
    return Image.asset(image_name1);
    return Image.asset(image_name2);
  }
  void btnRandom(){
    setState(() {
      img();
    });
  }
  Widget build(BuildContext context) {
    Widget titleSelection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Image.asset(
                  image_name1,
                  height: 100,
                  width: 100,)
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Image.asset(
                  image_name2,
                  height: 100,
                  width: 100,)
              ),
            ],
          ),
        ),
      ],
    ),
  );
    Widget build_button = Container(
    child: 
    SizedBox( 
      height: 80, //height of button
      width: 100, //width of button
      child:ElevatedButton(
        onPressed: btnRandom,
        style: ElevatedButton.styleFrom(
          primary: Colors.red[300], //background color of button
          side: BorderSide(width:3, color:Colors.brown), //border width and color
          minimumSize: Size(40, 50),
          elevation: 3, //elevation of button
          shape: RoundedRectangleBorder( //to set border radius to button
              borderRadius: BorderRadius.circular(30)
          ),
          padding: EdgeInsets.all(20) //content padding inside button
        ),
        child: Text("Roll") 
      )
    )
  );
    return MaterialApp(
      title:'Welcome to my App',
      theme: ThemeData(scaffoldBackgroundColor:Colors.blueGrey[600]),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Random Cube',textAlign: TextAlign.center,),
        ),
        body:Center(
          child: 
          Column(
            children: [
              Image.asset('assets/images/diceeLogo.png',
              height: 250,
              width: 250,),
              titleSelection,
              build_button,
            ],
        ),
        ),
      )
    );
  }
}