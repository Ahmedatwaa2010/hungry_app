import 'package:flutter/material.dart';

class CheckOutWidget extends StatelessWidget {
  const CheckOutWidget({
    super.key,
    required this.color,
    required this.title,
    this.subtitle,
    this.image,
    required this.values,
    required this.groupValue,
    this.onChanged,
    this.ontab,
    this.trailling,
  });
  final Color color;
  final Widget? title;
  final Widget? subtitle;
  final Widget? image;
  final String values;
  final String groupValue;
  final ValueChanged<String?>? onChanged;
  final GestureTapCallback? ontab;
  final Widget? trailling;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontab,
      subtitle: subtitle,
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      tileColor: color,
      leading: image,
      trailing:
          trailling ??
          Radio<String>(
            activeColor: Colors.white,
            value: values,
            groupValue: groupValue,
            onChanged: onChanged,
          ),

      title: title,
    );
  }
}
