import 'package:book_app_mvvm/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom(
      {Key? key,
      required this.backgroundColor,
      required this.textColor,
      this.borderRadius,
      this.funcation,
      required this.text})
      : super(key: key);
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String text;
  final VoidCallback? funcation;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(16)),
          backgroundColor: backgroundColor,
        ),
        onPressed: funcation,
        child: Text(
          text.toUpperCase(),
          style:
              StylesText.textFont20Reqular.copyWith(fontWeight: FontWeight.w900, color: textColor),
        ),
      ),
    );
  }
}
