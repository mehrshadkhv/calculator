import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget NumberButton(String TextButton, Color ButtonColor, Color TextColor){
    return ElevatedButton(onPressed: (){Calculate(TextButton);},
     child: Text(TextButton,
     style: TextStyle(
      fontSize: 25.0,
      color: TextColor,
     ),),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(70,70),
        backgroundColor: ButtonColor,
        shape: CircleBorder(),
      ),
     );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 5,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(padding: EdgeInsets.all(10.0),
              child: Text(text,
               style: TextStyle(color: Colors.white, fontSize: 80.0,),
              textAlign: TextAlign.left,),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton('C', Colors.grey, Colors.black),
              NumberButton('+/-', Colors.grey, Colors.black),
              NumberButton('%', Colors.grey, Colors.black),
              NumberButton('/', Colors.orange, Colors.white),
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton('7', (Colors.grey[850])!, Colors.white),
              NumberButton('8', (Colors.grey[850])!, Colors.white),
              NumberButton('9', (Colors.grey[850])!, Colors.white),
              NumberButton('×', Colors.orange, Colors.white),
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton('4', (Colors.grey[850])!, Colors.white),
              NumberButton('5', (Colors.grey[850])!, Colors.white),
              NumberButton('6', (Colors.grey[850])!, Colors.white),
              NumberButton('-', Colors.orange, Colors.white),
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton('1', (Colors.grey[850])!, Colors.white),
              NumberButton('2', (Colors.grey[850])!, Colors.white),
              NumberButton('3', (Colors.grey[850])!, Colors.white),
              NumberButton('+', Colors.orange, Colors.white),
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            ElevatedButton(onPressed: (){},
             child: Padding(
              padding: EdgeInsets.fromLTRB( 28 , 12 , 90 , 12 ),
              child: Text('0',
              style: TextStyle(fontSize: 35.0,color: Colors.white),
              ),),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(), 
                backgroundColor: (Colors.grey[850])!,
              ),
              ),
              NumberButton('.',(Colors.grey[850])!, Colors.white),
              NumberButton('=',Colors.orange, Colors.white),
            ],
          ),
        ],
      ),
      ),
    );
  }

  //Logic

  int firstNumber = 0;
  int secondNumber = 0;
  String result = '';
  String text = '';
  String operation = '';

  void Calculate(String TextButton){
    if(TextButton == "C"){
    result = '';
    text = '';
    firstNumber = 0;
    secondNumber = 0;
    }else if (TextButton == '+' || TextButton == '-' || TextButton == '×' || TextButton == '/'){
     firstNumber = int.parse(text);
     result = '';
     operation = TextButton;
    }else if(TextButton == '='){
     secondNumber = int.parse(text);
     if(operation == '+'){
      result = (firstNumber + secondNumber).toString();
     }
     if(operation == '-'){
      result = (firstNumber - secondNumber).toString();
     }
     if(operation == '×'){
      result = (firstNumber * secondNumber).toString();
     }
     if(operation == '/'){
      result = (firstNumber ~/ secondNumber).toString();
     }
    }else {
      result = int.parse(text + TextButton).toString();
    }
    setState(() {
      text = result;
    });
  }
}