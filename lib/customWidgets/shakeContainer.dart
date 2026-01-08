import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For HapticFeedback
import 'dart:math' as math;
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart'; // For custom vibration

class ShakeContainer extends StatefulWidget {
  final Widget child;
  final Duration? duration;
  final double? repetitions;
  final bool infiniteShake;

  const ShakeContainer({
    Key? key,
    required this.child,
    this.duration,
    this.repetitions = 1,
    this.infiniteShake = false,
  }) : super(key: key);

  @override
  ShakeContainerState createState() => ShakeContainerState();
}

class ShakeContainerState extends State<ShakeContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(seconds: 1),
    );

    _animation = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: 0 * math.pi / 180,
          end: -5 * math.pi / 180,
        ),
        weight: .2,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: -5 * math.pi / 180,
          end: 5 * math.pi / 180,
        ),
        weight: .2,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: 5 * math.pi / 180,
          end: -3 * math.pi / 180,
        ),
        weight: .2,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: -3 * math.pi / 180,
          end: 0,
        ),
        weight: .4,
      ),
    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void startShake() async {
    // Trigger haptic feedback
    HapticFeedback.mediumImpact();

    // Trigger vibration
    if (await Vibration.hasVibrator()) {
      print("Vibrate done");
      Vibration.vibrate(duration: 100);
      Vibration.vibrate(
        preset: VibrationPreset.longAlarmBuzz,
        duration: 500,
      );
    } else {
      print("Vibrate not done");
    }

    if (widget.infiniteShake) {
      _controller.repeat();
    } else {
      if (_controller.isCompleted) {
        _controller.reset();
      }
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _animation.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
