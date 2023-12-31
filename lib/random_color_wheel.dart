import 'package:animated_random_button/colorful_pie_painter.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'rotating_widget.dart';

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);

    final strokePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    canvas.drawPath(path, strokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class TriangleWidget extends StatelessWidget {
  double size;

  TriangleWidget({required this.size});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size / 4, size / 4),
      painter: TrianglePainter(),
      child: Container(
        width: size / 4,
        height: size / 4,
      ),
    );
  }
}

class RandomColorWheelController {
  late Color color;
}

class RandomColorWheel extends StatelessWidget {
  List<Color> colors;
  double size;
  Duration duration;
  late RotationAnimationWheel widget;
  final ui.VoidCallback? onPressed;
  bool waitForAnimation;
  RandomColorWheelController controller;
  late RotationAnimationWheel wheel;

  RandomColorWheel({
    super.key,
    required this.colors,
    this.size = 25,
    required this.onPressed,
    this.duration = const Duration(milliseconds: 500),
    this.waitForAnimation = true,
    required this.controller,
  });

  Color getColor() {
    return colors[colors.length -
        1 -
        (((wheel.getPosition() - pi / 2) % (pi * 2)) / 2 / pi * colors.length)
            .floor()];
  }

  @override
  Widget build(BuildContext context) {
    wheel = RotationAnimationWheel(
      onPressed: onPressed,
      size: size,
      duration: duration,
      waitForAnimation: waitForAnimation,
      child: ColorfulPie(
        colors: colors,
        size: size,
      ),
    );
    controller.color = colors[colors.length -
        1 -
        (((wheel.getPosition() - pi / 2) % (pi * 2)) / 2 / pi * colors.length)
            .floor()];
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            wheel,
            SizedBox(
              height: 0.1 * size,
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 0.85 * size,
            ),
            TriangleWidget(
              size: size,
            ),
          ],
        ),
      ],
    );
  }
}
