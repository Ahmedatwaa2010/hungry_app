import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  CustomTextfield({
    super.key,
    required this.obscureText,
    required this.hintText,
    required this.controller,
  });
  final bool obscureText;
  final String hintText;
  // controller for the textfield
  TextEditingController controller = TextEditingController();

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late bool _isObscure;
  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText;
  }

  void togglePassword() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      // validation for the textfield
      validator: (v) {
        if (v == null || v.isEmpty) {
          return "please fill ${widget.hintText} field";
        }
        return null;
      },
      // is a password field
      obscureText: _isObscure,
      decoration: InputDecoration(
        suffixIcon: widget.obscureText
            ? GestureDetector(
                onTap: () {
                  togglePassword();
                },
                child: Icon(CupertinoIcons.eye, color: Colors.white),
              )
            : null,
        // color of the textfield
        fillColor: Colors.transparent,
        // padding inside the textfield
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),

        filled: true,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.white),
        // border radius of the textfield
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
        //focus border radius of the textfield
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
