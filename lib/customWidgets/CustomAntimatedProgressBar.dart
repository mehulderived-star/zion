import 'package:flutter/material.dart';

import '../constant/color.dart';
import 'customProgressBar.dart';

class AnimatedProgressBar extends StatefulWidget {
  const AnimatedProgressBar({super.key});

  @override
  State<AnimatedProgressBar> createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animationController!.addListener(() => setState(() {}));
    animationController!.repeat();
  }

  @override
  void dispose() {
    animationController?.stop();
    animationController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(animationController!),
      child: GradientCircularProgressIndicator(
        radius: 30,
        gradientColors: [
          Colors.white,
          AppColors().primary100Color,
        ],
        strokeWidth: 10.0,
      ),
    );
  }
}
