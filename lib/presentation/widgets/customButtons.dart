


import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class CustomButtons extends HookWidget {
  final String text;
  final Function() onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool isLoadingActive;
  final TextDecoration textDecoration;

  const CustomButtons.aux(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.isLoadingActive = false})
      : backgroundColor = Colors.yellow,
        textColor = Colors.black,
        textDecoration = TextDecoration.none,
        super(key: key);

  const CustomButtons.primary(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.isLoadingActive = false})
      : backgroundColor = Colors.black,
        textColor = Colors.white,
        textDecoration = TextDecoration.none,
        super(key: key);

  CustomButtons.secondary({
    Key? key,
    required this.text,
    required this.onPressed,
  })  : backgroundColor = Colors.grey,
        textColor = Colors.black,
        isLoadingActive = false,
        textDecoration = TextDecoration.none,
        super(key: key);

  // CustomButtons.action({
  //   Key? key,
  //   required this.text,
  //   required this.onPressed,
  // })  : backgroundColor = AppPalette.actionColor,
  //       textColor = Colors.black,
  //       isLoadingActive = false,
  //       textDecoration = TextDecoration.none,
  //       super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoadingActive
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              color: backgroundColor.withOpacity(0.6),
            ),
            child: Center(
              child: Text(
                'Loading...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
          )
        : InkWell(
            onTap: onPressed,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                color: backgroundColor,
              ),
              child: Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          );
  }
}