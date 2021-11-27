import 'package:flutter/material.dart';

class LineDashedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..strokeWidth = 2..color = Colors.grey;
    double max = 55;
    double dashWidth = 5;
    double dashSpace = 5;
    double startX = 50;
    while (max >= 0) {
      canvas.drawLine(Offset(0 + max, 0), Offset(startX, 10 + dashWidth), paint);
      final double space = (dashSpace + dashWidth);
      startX += space;
      max -= space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}