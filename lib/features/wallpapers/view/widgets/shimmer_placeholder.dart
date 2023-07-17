import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPlaceHolder extends StatelessWidget {
  const ShimmerPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = Colors.grey.shade300;

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: baseColor,
      ),
    );
  }
}
