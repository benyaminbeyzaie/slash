import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:slash/widgets/slashed_network_image.dart';

import 'wallpaper_card_wrapper.dart';

class WallpaperCard extends StatelessWidget {
  final String id;
  final String imagePath;

  const WallpaperCard({
    super.key,
    required this.id,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return WallpaperCardWrapper(
      child: SlashedNetworkImage(
        onClick: () => context.router.pushNamed("/wallpapers/$id"),
        imageUrl: imagePath,
      ),
    );
  }
}
