import 'package:flutter/material.dart';
import 'package:full_calculator/buttons.dart';
import 'package:full_calculator/glassbutton.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

var userQue = '';
var userAns = '';

class _MyAppState extends State<MyApp> {
  List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 27,
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            userQue,
                            style: TextStyle(
                                color: Colors.grey.shade400, fontSize: 35),
                          )),
                      Container(
                          alignment: Alignment.centerRight,
                          child: Text(userAns,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 50))),
                    ]),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return CalButton(
                          buttonTap: () {
                            setState(() {
                              userQue = '';
                              userAns = '';
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.red,
                          textColor: Colors.red,
                        );
                      } else if (index == 1) {
                        return CalButton(
                          buttonTap: () {
                            setState(() {
                              userQue =
                                  userQue.substring(0, userQue.length - 1);
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.green,
                          textColor: Colors.green,
                        );
                      } else if (index == buttons.length - 1) {
                        return CalButton(
                          buttonTap: () {
                            setState(() {
                              operations();
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.green,
                          textColor: Colors.green,
                        );
                      } else {
                        return CalButton(
                          buttonTap: () {
                            setState(() {
                              userQue += buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.tealAccent
                              : Colors.white,
                          textColor: Colors.grey.shade400,
                        );
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void operations() {
    String finalQue = userQue;
    Parser p = Parser();
    Expression exp = p.parse(finalQue);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAns = eval.toString();
  }

  isOperator(String button) {
    if (button == '%' ||
        button == '+' ||
        button == '-' ||
        button == '*' ||
        button == '=' ||
        button == '/') {
      return true;
    } else {
      return false;
    }
  }
}
