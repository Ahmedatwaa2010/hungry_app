import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/shared/custom_text.dart';

class ProfileBtn extends StatelessWidget {
  const ProfileBtn({
    super.key,
    this.color,
    required this.text,
    required this.textcolor,
    required this.icon,
    this.onTab,
  });

  final Color? color;
  final String text;
  final Color textcolor;
  final IconData icon;
  final GestureTapCallback? onTab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: onTab,
        child: Container(
          height: 70,
          width: 175,
          decoration: BoxDecoration(
            color: color ?? Colors.white,
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text: text, fontSize: 18, color: textcolor),
              const Gap(10),
              Icon(icon, color: textcolor, size: 24),
            ],
          ),
        ),
      ),
    );
  }
}
