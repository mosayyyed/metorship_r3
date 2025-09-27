import 'package:flutter/material.dart';
import '../screens/physics_screen.dart';

class DropTargetWidget extends StatelessWidget {
  final DropContainer container;
  final Function(DragBall) onAccept;
  final bool isFilled;

  const DropTargetWidget({
    super.key,
    required this.container,
    required this.onAccept,
    required this.isFilled,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<DragBall>(
      onAcceptWithDetails: (details) => onAccept(details.data),
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: isFilled
                ? container.color
                : container.color.withOpacity(0.3),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: container.color, width: 2),
          ),
          child: isFilled
              ? Icon(Icons.check, color: Colors.white, size: 40)
              : null,
        );
      },
    );
  }
}
