import 'package:flutter/material.dart';

class LoadingDotsAnimation extends StatefulWidget {
  final bool isAnimating;
  final int dotCount;
  final Duration duration;
  final Color dotColor;

  const LoadingDotsAnimation({
    super.key,
    required this.isAnimating,
    this.dotCount = 3,
    this.duration = const Duration(milliseconds: 400),
    this.dotColor = Colors.blue,
  });

  @override
  State<LoadingDotsAnimation> createState() => _LoadingDotsAnimationState();
}

class _LoadingDotsAnimationState extends State<LoadingDotsAnimation>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _controllers = List.generate(
      widget.dotCount,
      (index) => AnimationController(duration: widget.duration, vsync: this),
    );

    _animations = _controllers.map((controller) {
      return Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    }).toList();

    if (widget.isAnimating) {
      _startAnimation();
    }
  }

  void _startAnimation() async {
    while (mounted && widget.isAnimating) {
      for (int i = 0; i < _controllers.length; i++) {
        if (!mounted || !widget.isAnimating) break;
        try {
          await _controllers[i].forward();
        } catch (e) {
          if (!mounted) break;
        }
        if (!mounted || !widget.isAnimating) break;
        await Future.delayed(Duration(milliseconds: 80));
      }

      if (!mounted || !widget.isAnimating) break;
      await Future.delayed(Duration(milliseconds: 100));

      for (int i = 0; i < _controllers.length; i++) {
        if (!mounted) break;
        try {
          await _controllers[i].reverse();
        } catch (e) {
          if (!mounted) break;
        }
      }

      if (!mounted || !widget.isAnimating) break;
      await Future.delayed(Duration(milliseconds: 200));
    }
  }

  @override
  void didUpdateWidget(LoadingDotsAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isAnimating && !oldWidget.isAnimating) {
      _startAnimation();
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.dotCount, (index) {
        return AnimatedBuilder(
          animation: _animations[index],
          builder: (context, child) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Transform.scale(
                scale: 0.5 + (_animations[index].value * 0.5),
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: widget.dotColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
