import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimationLimiterWidget extends StatelessWidget {
  final int position;
  final Widget child;

  const AnimationLimiterWidget({super.key, required this.position, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
			position: position,
			duration: const Duration(milliseconds: 1000),
			child: SlideAnimation(
				verticalOffset: 50.0,
				child: FadeInAnimation(child: child),
			)
		);
  }
}
