import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.prefixIcon,
      this.textColor});
  final Widget? prefixIcon;
  final TextEditingController controller;
  final String hintText;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        style: TextStyle(color: textColor),
        decoration: InputDecoration(prefixIcon: prefixIcon, hintText: hintText,
         border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),),
        controller: controller,
        
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
    );
  }
}
