import 'package:flutter/material.dart';
import 'package:slash/features/wallpapers/view/widgets/shimmer_placeholder.dart';
import 'package:slash/widgets/wallpaper_card/wallpaper_card_wrapper.dart';

import 'base_grid_view.dart';

class GridViewSkeleton extends StatelessWidget {
  const GridViewSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseGridView(
      itemCount: 10,
      itemBuilder: (context, index) {
        return AspectRatio(
          aspectRatio: index % 2 == 1 ? 1.7 : 0.8,
          child: const WallpaperCardWrapper(child: ShimmerPlaceHolder()),
        );
      },
    );
  }
}
