import 'package:flutter/material.dart';
//import '../widgets/button.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget button(
    String buttonText,
    Color buttonTextColor,
    BuildContext context,
    double buttonHeight,
  ) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,

      width: MediaQuery.of(context).size.width * 0.1,
      //color: Colors.black12,
      child: RaisedButton(
        color: Colors.black12,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.normal,
              color: buttonTextColor,
            ),
          ),
        ),
        onPressed: () {
          buttonPressed(buttonText);
        },
      ),
    );
  }

  String expressionOutput = "";
  String expressionInput = "";
  String result = "";

  void onRemovePressed() {
    setState(() {
      expressionInput = "";
      expressionOutput = "";
    });
  }

  void buttonPressed(String buttontext) {
    if (buttontext == "=") {
      try {
        result = expressionInput;
        result = result.replaceAll('x', '*');
        result = result.replaceAll('÷', '/');
        Parser p = Parser();
        Expression exp = p.parse(result);
        ContextModel cm = ContextModel();
        expressionOutput = '${exp.evaluate(EvaluationType.REAL, cm)}';
      } catch (e) {}
    } else if (buttontext == 'c') {
      expressionInput =
          expressionInput.substring(0, (expressionInput.length - 1));
    } else {
      expressionInput += buttontext;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(top: 20, bottom: 40),
            child: Text(
              expressionOutput,
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.deepOrange[400]),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(bottom: 40),
            child: Text(
              expressionInput,
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          Expanded(child: Divider()),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                //height: MediaQuery.of(context).size.height *.6,
                width: MediaQuery.of(context).size.width * .75,
                child: Container(
                  decoration: BoxDecoration(border: Border(right: BorderSide(width: 0.3, color: Colors.blue[400]) ),),
                  child: Table(
                    //border: TableBorder.lerp(),
                    children: [
                      TableRow(
                        children: [
                          button('7', Colors.white, context, 1.3),
                          button('8', Colors.white, context, 1.3),
                          button('9', Colors.white, context, 1.3),
                        ],
                      ),
                      TableRow(
                        children: [
                          button('4', Colors.white, context, 1.3),
                          button('5', Colors.white, context, 1.3),
                          button('6', Colors.white, context, 1.3),
                        ],
                      ),
                      TableRow(
                        children: [
                          button('1', Colors.white, context, 1.3),
                          button('2', Colors.white, context, 1.3),
                          button('3', Colors.white, context, 1.3),
                        ],
                      ),
                      TableRow(
                        children: [
                          button('0', Colors.white, context, 1.3),
                          button('.', Colors.white, context, 1.3),
                          button('=', Colors.deepOrange[400], context, 1.3),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                //height: MediaQuery.of(context).size.height *.6,
                width: MediaQuery.of(context).size.width * .25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        Container(
                          //height: 0.5,
                          //color: Colors.black12,
                          child: RaisedButton(
                            elevation: 0,
                            color: Colors.black12,
                            onPressed: () {},
                            onLongPress: () {onRemovePressed();},
                            child: IconButton(
                                icon: Icon(Icons.arrow_back_ios),
                                color: Colors.blue,
                                onPressed: () {
                                  buttonPressed('c');
                                }),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        button('÷', Colors.blue, context, 1.1),
                      ],
                    ),
                    TableRow(
                      children: [
                        button('x', Colors.blue, context, 1.1),
                      ],
                    ),
                    TableRow(
                      children: [
                        button('-', Colors.blue, context, 1.1),
                      ],
                    ),
                    TableRow(
                      children: [
                        button('+', Colors.blue, context, 1.11),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
              child: IconButton(
            color: Colors.blue,
            onPressed: () {},
            icon: Icon(Icons.keyboard_arrow_up),
          ))
        ],
      ),
    );
  }
}
