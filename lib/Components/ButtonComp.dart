import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonComp extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final double width;
  final Color textColor;
  final Color borderColor;
  final Color backgroundColor;
  final Color iconColor;
  final double fontSize;
  final double borderWidth;
  final double radius;

  // Constructor
  const ButtonComp(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      this.padding = const EdgeInsets.symmetric(horizontal: 0.0),
      this.width = double.infinity,
      this.textColor = Colors.white,
      this.borderColor = const Color(0xffF4622E), // Border color added
      this.backgroundColor = const Color(0xffF4622E),
      this.fontSize = 15,
      this.radius = 10,
      this.iconColor = Colors.black,
      this.borderWidth = 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // Button will take the full width of the container
      padding: padding,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        label: Text(
          buttonText,
          style: TextStyle(
            color: textColor,
            fontFamily: "Bree",
            fontSize: fontSize,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Set background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius), // Border radius
            side: BorderSide(
                color: borderColor, width: borderWidth), // Border added
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          alignment: Alignment.center, // Align text and icon to the left
          elevation: 0,
        ),
      ),
    );
  }
}
