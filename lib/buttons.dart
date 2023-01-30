import 'package:flutter/material.dart';

class CalButton extends StatelessWidget {
  const CalButton(
      {Key? key,
      required this.buttonText,
      this.color,
      this.textColor,
      this.buttonTap})
      : super(key: key);

  final String buttonText;
  final color;
  final textColor;
  final buttonTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTap,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          child: Center(
              child: Text(
            buttonText,
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 15),
          )),
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: color, blurRadius: 5, spreadRadius: 1),
              BoxShadow(color: color, blurRadius: 5, spreadRadius: 1)
            ],
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}
