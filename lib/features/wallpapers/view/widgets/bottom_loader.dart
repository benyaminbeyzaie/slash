import 'package:flutter/material.dart';

import 'shimmer_placeholder.dart';
import 'wallpaper_card/wallpaper_card_wrapper.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 0.8,
      child: WallpaperCardWrapper(child: ShimmerPlaceHolder()),
    );
  }
}
