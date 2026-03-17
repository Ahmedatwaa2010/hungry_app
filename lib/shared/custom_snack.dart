import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'custom_text.dart';

SnackBar customSnack(errorMsg, {Color? color}) {
  return SnackBar(
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    backgroundColor: color ?? Colors.red.shade900,
    content: FittedBox(
      child: Row(
        children: [
          Icon(
            color == Colors.green
                ? CupertinoIcons.check_mark
                : CupertinoIcons.info,
            color: Colors.white,
          ),
          Gap(10),
          CustomText(
            text: errorMsg,
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    ),
  );
}
