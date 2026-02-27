import 'package:flutter/material.dart';

class PopIcon extends StatelessWidget {
  const PopIcon({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Icon(
        Icons.arrow_back,
        color: color ?? Color(0xff3C2F2F),
        size: 30,
      ),
    );
  }
}
