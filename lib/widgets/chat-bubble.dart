import 'package:flutter/material.dart';

class CustomShape extends CustomPainter {
  final Color bgColor;

  CustomShape(this.bgColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = bgColor;

    var path = Path();
    path.moveTo(-8, 24);
    path.lineTo(0, 16);
    path.lineTo(0, 32);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class ChatBubble extends StatelessWidget {
  final Widget child;
  final Color color;

  const ChatBubble({Key? key, required this.child, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          Flexible(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPaint(painter: CustomShape(color)),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: child,
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
