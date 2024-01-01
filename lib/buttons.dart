import 'package:flutter/material.dart';

class CalButton extends StatelessWidget {
  final String buttonText;
  final void Function()? buttonTap;
  final Widget? widget;
  final Color? textColor;
  final Color? buttonColor;
  const CalButton(
      {Key? key,
      required this.buttonText,
      this.buttonTap,
      this.widget,
      this.textColor,
      this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
        style: FilledButton.styleFrom(backgroundColor: buttonColor),
        // onLongPress: () {

        // },
        onPressed: buttonTap,
        child: Center(
          child: widget ??
              Text(
                buttonText,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: textColor),
              ),
        ));
  }
}
