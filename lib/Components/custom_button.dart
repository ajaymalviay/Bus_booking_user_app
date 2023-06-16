import 'package:flutter/material.dart';
import '../Theme/colors.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Function? onTap;
  final Color? color;
  final Color? textColor;

  CustomButton(this.text, {this.onTap, this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color ?? theme.primaryColor,
                  color ?? theme.primaryColorLight,
                ],
                stops: [
                  0.3,
                  0.7
                ]),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: color == theme.scaffoldBackgroundColor
                    ? theme.primaryColorLight
                    : transparentColor)),
        child: textColor == null
            ? Text(text!, style: theme.textTheme.button)
            : Text(
                text!,
                style: theme.textTheme.button!.copyWith(
                    foreground: Paint()
                      ..shader = LinearGradient(
                        colors: [
                          theme.primaryColor,
                          theme.primaryColorLight,
                        ],
                      ).createShader(Rect.fromLTWH(100, 100, 200, 1500))),
              ),
      ),
    );
  }
}
