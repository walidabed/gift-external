import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredPopup extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final double borderRadius;
  final bool isDismissible;

  // Constructor
  const BlurredPopup({
    Key? key,
    required this.child,
    this.backgroundColor = Colors.white,
    this.borderRadius = 15.0, // Border radius for the popup
    this.isDismissible =
        true, // To control if it can be dismissed by tapping outside
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero, // Remove default padding around the dialog
      shape: const RoundedRectangleBorder(),
      elevation: 0,
      backgroundColor:
          Color(0xFFFFE8DB).withOpacity(0.5), // Fully transparent background
      child: Stack(
        children: [
          // Background blur effect (applies to outer page when popup is open)
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 5.0, sigmaY: 5.0), // Apply blur to background
              child: Container(
                color: Colors.transparent, // Background overlay
              ),
            ),
          ),
          // The content of the popup (provided by the child widget)
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width, // Full screen width
                padding: EdgeInsets.all(20), // Padding for inner content
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: child, // The custom content inside the popup
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
