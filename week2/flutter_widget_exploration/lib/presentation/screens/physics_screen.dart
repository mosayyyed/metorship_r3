import 'package:flutter/material.dart';
import '../widgets/draggable_ball_widget.dart';
import '../widgets/drop_target_widget.dart';

class DragBall {
  final Color color;
  final String name;
  const DragBall({required this.color, required this.name});
}

class DropContainer {
  final Color color;
  final String name;
  const DropContainer({required this.color, required this.name});
}

class PhysicsScreen extends StatefulWidget {
  const PhysicsScreen({super.key});

  @override
  State<PhysicsScreen> createState() => _PhysicsScreenState();
}

class _PhysicsScreenState extends State<PhysicsScreen>
    with TickerProviderStateMixin {
  final List<DragBall> balls = const [
    DragBall(color: Colors.red, name: 'Red'),
    DragBall(color: Colors.blue, name: 'Blue'),
    DragBall(color: Colors.green, name: 'Green'),
  ];

  final List<DropContainer> containers = const [
    DropContainer(color: Colors.red, name: 'Red'),
    DropContainer(color: Colors.blue, name: 'Blue'),
    DropContainer(color: Colors.green, name: 'Green'),
  ];

  String feedbackMessage = '';
  bool showSuccess = false;
  int correctMatches = 0;
  late AnimationController _feedbackController;
  late Animation<double> _feedbackAnimation;

  Set<String> filledContainers = {};

  @override
  void initState() {
    super.initState();
    _feedbackController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _feedbackAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _feedbackController, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  void _handleBallDrop(DragBall ball, DropContainer container) {
    final bool isCorrect = ball.color == container.color;

    setState(() {
      if (isCorrect) {
        filledContainers.add(container.name);
        correctMatches++;
        showSuccess = true;
        feedbackMessage = correctMatches == balls.length
            ? '🎉 All matched! Well done!'
            : 'Perfect! ${ball.name} matched!';
      } else {
        showSuccess = false;
        feedbackMessage = 'Try again! ${ball.name} doesn\'t match.';
      }
    });

    _showFeedback();
  }

  void _showFeedback() {
    _feedbackController.forward().then((_) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            feedbackMessage = '';
          });
          _feedbackController.reverse();
        }
      });
    });
  }

  void _resetGame() {
    setState(() {
      filledContainers.clear();
      correctMatches = 0;
      feedbackMessage = '';
      showSuccess = false;
    });
    _feedbackController.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Colors'),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _resetGame),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            if (feedbackMessage.isNotEmpty)
              AnimatedBuilder(
                animation: _feedbackAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _feedbackAnimation.value,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 30),
                      decoration: BoxDecoration(
                        color: showSuccess ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        feedbackMessage,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),

            const Text(
              'Drag each ball to its matching color:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: balls
                  .map((ball) => DraggableBallWidget(ball: ball))
                  .toList(),
            ),

            const SizedBox(height: 60),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: containers
                  .map(
                    (container) => DropTargetWidget(
                      container: container,
                      onAccept: (ball) => _handleBallDrop(ball, container),
                      isFilled: filledContainers.contains(container.name),
                    ),
                  )
                  .toList(),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
