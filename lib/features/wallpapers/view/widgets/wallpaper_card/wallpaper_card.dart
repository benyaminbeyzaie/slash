import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:slash/features/wallpapers/view/widgets/shimmer_placeholder.dart';

import 'wallpaper_card_wrapper.dart';

class WallpaperCard extends StatelessWidget {
  final String imagePath;
  const WallpaperCard({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return WallpaperCardWrapper(
      child: CachedNetworkImage(
        imageUrl: imagePath,
        placeholder: (context, url) => const ShimmerPlaceHolder(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
