import 'package:book_app_mvvm/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErorr extends StatelessWidget {
  const CustomErorr({Key? key, required this.erorrMessage}) : super(key: key);
  final String erorrMessage;
  @override
  Widget build(BuildContext context) {
    return Text(
      erorrMessage,
      style: StylesText.textFont20Reqular,
    );
  }
}
