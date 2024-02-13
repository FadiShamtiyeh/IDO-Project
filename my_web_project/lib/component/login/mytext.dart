import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double number;

  const CustomText({super.key, required this.text, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / number,
        left: MediaQuery.of(context).size.width / 12,
      ),
      width: 514,
      height: 24,
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Color(0xFFFFFFFF),
          fontFamily: 'HelveticaNeue',
          fontWeight: FontWeight.w300,
          fontSize: 16,
          letterSpacing: 0,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
