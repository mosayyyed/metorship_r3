import 'package:flutter/material.dart';
import '../screens/physics_screen.dart';

class DraggableBallWidget extends StatelessWidget {
  final DragBall ball;

  const DraggableBallWidget({super.key, required this.ball});

  @override
  Widget build(BuildContext context) {
    return Draggable<DragBall>(
      data: ball,

      feedback: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: ball.color.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
      ),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: ball.color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
      ),
    );
  }
}
