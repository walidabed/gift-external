// ignore_for_file: use_super_parameters

import 'dart:ffi';

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

  // Constructor
  const PopupButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.icon,
    this.padding = const EdgeInsets.symmetric(horizontal: 0.0),
    this.width = double.infinity,
    this.textColor = Colors.black,
    this.borderColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // Button will take the full width of the container
      padding: padding,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          'assets/Images/$icon.svg',
        ),
        label: Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                buttonText,
                style: TextStyle(
                    color: textColor,
                    fontFamily: "EthosNova",
                    fontWeight: FontWeight.w500),
              ),
              isSelected
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected ? Colors.white : Colors.transparent,
                        border: Border.all(
                            color:
                                isSelected ? Colors.black : Colors.transparent),
                      ),
                      padding: EdgeInsets.all(2),
                      child: SvgPicture.asset(
                        'assets/Images/check.svg',
                        width: 12,
                        height: 12,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Set background color to white
          side: BorderSide(color: borderColor), // Border color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Border radius
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          alignment: Alignment.centerLeft, // Align text and icon to the left
          elevation: 0,
        ),
      ),
    );
  }
}
