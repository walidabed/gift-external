import 'package:flutter/material.dart';

class TextAreaComponent extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final EdgeInsetsGeometry padding;
  final double width;
  final Color textColor;
  final Color hintTextColor;
  final Color backgroundColor;
  final int minLines;
  final int maxLines;
  final Color borderColor;

  // Constructor
  const TextAreaComponent({
    Key? key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.padding = const EdgeInsets.symmetric(horizontal: 0.0),
    this.width = double.infinity,
    this.textColor = Colors.black,
    this.hintTextColor = Colors.black,
    this.backgroundColor = const Color(0xFFFFE8DB),
    this.minLines = 2,
    this.maxLines = 5, // Set a max line limit to control the height
    this.borderColor = const Color(0xFFFFE8DB),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // This will take the full available width.
      padding: padding, // This controls the inner padding.
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(color: textColor, fontFamily: "EthosNova"),
        maxLines: maxLines, // Allows the text area to expand in height.
        minLines: minLines, // Set the initial height for the text area.
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
            borderSide: BorderSide(
                color: borderColor, width: 1.5), // Border color and width
            borderRadius: BorderRadius.circular(8), // Add border radius
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor,
                width: 2.0), // Border color and width when focused
            borderRadius: BorderRadius.circular(8), // Add border radius
          ),
        ),
      ),
    );
  }
}
