import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:full_calculator/buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class ButtonGrid extends StatefulWidget {
  const ButtonGrid({super.key});

  @override
  State<ButtonGrid> createState() => _ButtonGridState();
}

class _ButtonGridState extends State<ButtonGrid> {
  var userQue = '';
  var userAns = '';
  List<String> buttons = [
    'AC',
    '%',
    '/',
    '*',
    '7',
    '8',
    '9',
    '-',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '.',
    '0',
    'A',
    'DEL',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Calculator"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0).copyWith(top: 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: width,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).colorScheme.secondaryContainer),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AutoSizeText(
                          userQue,
                          maxLines: 2,
                          softWrap: true,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: MediaQuery.of(context).size.width / 7,
                          ),
                        ),
                        Flexible(
                          child: AutoSizeText(
                            userAns,
                            maxLines: 1,
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: MediaQuery.of(context).size.width / 5,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              GridView.builder(
                  // padding: const EdgeInsets.all(10),
                  shrinkWrap: true,
                  itemCount: buttons.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    if (buttons[index] == 'AC') {
                      return CalButton(
                        buttonColor:
                            Theme.of(context).colorScheme.errorContainer,
                        textColor:
                            Theme.of(context).colorScheme.onErrorContainer,
                        buttonTap: () {
                          setState(() {
                            userQue = '';
                            userAns = '';
                          });
                        },
                        buttonText: buttons[index],
                      );
                    } else if (buttons[index] == 'DEL') {
                      return CalButton(
                        widget: const Icon(Icons.backspace_rounded),
                        buttonTap: () {
                          if (userQue.isNotEmpty) {
                            setState(() {
                              userQue =
                                  userQue.substring(0, userQue.length - 1);
                            });
                          }
                        },
                        buttonText: buttons[index],
                      );
                    } else if (buttons[index] == '=') {
                      return CalButton(
                        textColor:
                            Theme.of(context).colorScheme.onPrimaryContainer,
                        buttonColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        buttonTap: () {
                          setState(() {
                            operations();
                          });
                        },
                        buttonText: buttons[index],
                      );
                    } else if (buttons[index] == 'A') {
                      return CalButton(
                        buttonTap: () {
                          setState(() {
                            operations();
                          });
                        },
                        buttonText: buttons[index],
                      );
                    } else {
                      if (isOperator(buttons[index])) {
                        return CalButton(
                          buttonText: buttons[index],
                          textColor:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          buttonColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          buttonTap: () {
                            setState(() {
                              userQue += buttons[index];
                            });
                          },
                        );
                      }
                      return CalButton(
                        buttonTap: () {
                          setState(() {
                            userQue += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                      );
                    }
                  }),
            ],
          ),
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
        button == '/' ||
        button == '.') {
      return true;
    } else {
      return false;
    }
  }
}
