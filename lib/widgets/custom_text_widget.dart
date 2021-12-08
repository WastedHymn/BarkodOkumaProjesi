import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String str;
  final String variableString;

  const CustomText({
    Key? key,
    required this.str,
    required this.variableString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          str,
          style: const TextStyle(
            fontFamily: "Open Sans",
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          variableString,
          style: const TextStyle(
            fontFamily: "Open Sans",
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}
