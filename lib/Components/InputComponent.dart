import 'package:flutter/material.dart';

class InputComponent extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final EdgeInsetsGeometry padding;
  final double width;
  final Color textColor;
  final Color borderColor;
  final Color hintTextColor;
  final Color backgroundColor;

  // Constructor
  const InputComponent({
    Key? key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.padding = const EdgeInsets.symmetric(horizontal: 0.0),
    this.width = double.infinity,
    this.textColor = Colors.black,
    this.borderColor = Colors.black,
    this.hintTextColor = Colors.black,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // This will take the full available width.
      padding: padding, // This controls the inner padding.
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(color: textColor, fontFamily: ""),
        decoration: InputDecoration(
          filled: true,
          fillColor: backgroundColor,
          hintText: hintText,
          hintStyle: TextStyle(
              color: hintTextColor,
              fontSize: 14,
              fontFamily: "EthosNova",
              fontWeight: FontWeight.w500),
          contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
