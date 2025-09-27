import 'package:flutter/material.dart';
import '../widgets/loading_dots_animation.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  bool _isAnimating = true; // Start animation by default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loading Animation'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Watch the dots dance!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
            ),

            const SizedBox(height: 60),

            Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: LoadingDotsAnimation(
                isAnimating: _isAnimating,
                dotCount: 3,
                duration: const Duration(milliseconds: 1500),
                dotColor: Theme.of(context).colorScheme.primary,
              ),
            ),

            const SizedBox(height: 60),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isAnimating = !_isAnimating;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _isAnimating
                    ? Colors.red.shade400
                    : Colors.green.shade400,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(_isAnimating ? Icons.pause : Icons.play_arrow),
                  const SizedBox(width: 8),
                  Text(
                    _isAnimating ? 'Pause' : 'Play',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
