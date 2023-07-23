import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:slash/features/liked_wallpapers/view/like_button.dart';
import 'package:slash/models/wallpaper_model.dart';
import 'package:slash/router/app_router.gr.dart';
import 'package:slash/widgets/slashed_network_image.dart';

import 'wallpaper_card_wrapper.dart';

class WallpaperCard extends StatelessWidget {
  final WallpaperModel wallpaper;

  const WallpaperCard({
    super.key,
    required this.wallpaper,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 400),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: WallpaperCardWrapper(
              onTap: () => context.router.push(
                SingleWallpaperRoute(
                  wallpaperModel: wallpaper,
                  wallpaperId: wallpaper.id,
                ),
              ),
              child: Hero(
                tag: wallpaper.id,
                child: SlashedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: wallpaper.thumbs.original,
                ),
              ),
            ),
          ),
          LikeButton(wallpaper: wallpaper),
        ],
      ),
    );
  }
}
