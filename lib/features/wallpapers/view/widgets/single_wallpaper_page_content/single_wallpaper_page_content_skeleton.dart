import 'package:flutter/material.dart';
import 'package:slash/features/wallpapers/view/widgets/shimmer_placeholder.dart';

class SingleWallpaperPageContentSkeleton extends StatelessWidget {
  const SingleWallpaperPageContentSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildColorTags(),
        buildUploaderDetails(),
        buildDownloader(),
      ],
    );
  }

  Widget buildDownloader() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ShimmerPlaceHolder(
        radius: 8,
        height: 35,
      ),
    );
  }

  Widget buildUploaderDetails() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ShimmerPlaceHolder(
            width: 60,
            height: 60,
            radius: 30,
          ),
          SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerPlaceHolder(
                height: 12,
                width: 100,
              ),
              SizedBox(height: 2),
              ShimmerPlaceHolder(
                height: 8,
                width: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildColorTags() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 5,
        children: [for (var i = 0; i < 5; i += 1) i]
            .map(
              (e) => const ShimmerPlaceHolder(
                width: 50,
                height: 20,
                radius: 5,
              ),
            )
            .toList(growable: false),
      ),
    );
  }
}
