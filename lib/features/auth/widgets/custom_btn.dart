import 'package:flutter/material.dart';
import 'package:hungry_app/core/constant/app_color.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CustomAuthBtn extends StatelessWidget {
  const CustomAuthBtn({super.key, this.onTap, required this.text});
  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        width: double.infinity,
        child: CustomText(
          color: PrimaryColors.primaryColor,
          text: text,
          fontSize: 25,
          fontWeight: FontWeight.w700,
          leeterSpacing: 2.5,
        ),
      ),
    );
  }
}
