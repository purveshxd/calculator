import 'package:flutter/material.dart';

class GlassButton extends StatelessWidget {
  const GlassButton(
      {Key? key,
      this.buttonTap,
      required this.buttonText,
      this.textColor,
      this.color})
      : super(key: key);
  final buttonTap;
  final String buttonText;
  final textColor;
  final color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTap,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
            //blur

            //gradient
            //child
            ),
      ),
    );
    ;
  }
}
