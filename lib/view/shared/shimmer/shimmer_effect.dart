import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// ShimmerEffect is a [Widget] that shows shimmer effect.
class ShimmerEffect extends StatelessWidget {
  final Widget child;
  final bool enabled;

  const ShimmerEffect({super.key, required this.child, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xffD8D8D8),
      highlightColor: const Color(0xffB2B2B2),
      enabled: enabled,
      child: child,
    );
  }
}
