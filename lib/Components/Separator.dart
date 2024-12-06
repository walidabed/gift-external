// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final double height;
  final double dashWidth;
  final double dashSpace;
  final Color color;

  const Separator({
    Key? key,
    this.height = 1.0,
    this.dashWidth = 6.0,
    this.dashSpace = 4.0,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, height),
      painter: DashedLinePainter(
        dashWidth: dashWidth,
        dashSpace: dashSpace,
        color: color,
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Color color;

  DashedLinePainter({
    required this.dashWidth,
    required this.dashSpace,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    double startX = 0.0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
