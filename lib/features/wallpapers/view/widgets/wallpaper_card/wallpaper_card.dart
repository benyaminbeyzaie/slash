import 'package:flutter/material.dart';
import 'package:slash/widgets/slashed_network_image.dart';

import 'wallpaper_card_wrapper.dart';

class WallpaperCard extends StatelessWidget {
  final String imagePath;
  final bool isMocked;

  const WallpaperCard({
    super.key,
    required this.imagePath,
    this.isMocked = false,
  });

  @override
  Widget build(BuildContext context) {
    return WallpaperCardWrapper(
      child: isMocked
          ? const Placeholder()
          : SlashedNetworkImage(
              imageUrl: imagePath,
              
            ),
    );
  }
}
