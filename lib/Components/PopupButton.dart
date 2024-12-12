// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopupButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final String icon;
  final EdgeInsetsGeometry padding;
  final double width;
  final Color textColor;
  final Color borderColor;
  final Color backgroundColor;
  final Color iconColor;
  final bool isSelected;

  const PopupButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.icon,
    this.padding = const EdgeInsets.symmetric(horizontal: 0.0),
    this.width = double.infinity,
    this.textColor = Colors.white,
    this.borderColor = Colors.black,
    this.backgroundColor = const Color(0xffF4622E),
    this.iconColor = Colors.white,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
          elevation: 0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/Images/$icon.svg',
              color: iconColor,
              width: 13,
              height: 13,
            ),
            const SizedBox(height: 8), // Space between icon and text
            SizedBox(width: 8),
            Text(
              buttonText,
              style: TextStyle(
                color: textColor,
                fontFamily: "Bree",
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            if (isSelected) ...[
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(2),
                child: SvgPicture.asset(
                  'assets/Images/check.svg',
                  width: 12,
                  height: 12,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
