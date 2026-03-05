import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'custom_text.dart';

SnackBar customSnack(errorMsg) {
  return SnackBar(
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.red.shade900,
    content: FittedBox(
      child: Row(
        children: [
          const Icon(CupertinoIcons.info, color: Colors.white),
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
