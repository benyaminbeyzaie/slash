import 'package:flutter/material.dart';
import 'package:slash/widgets/bottom_loader.dart';
import 'package:slash/widgets/grid_view/base_grid_view.dart';
import 'package:slash/widgets/wallpaper_card/wallpaper_card.dart';
import 'package:slash/models/wallpaper_model.dart';

class WallpapersListWidget extends StatelessWidget {
  final bool hasReachedMax;
  final List<WallpaperModel> wallpapers;
  final ScrollController? controller;

  const WallpapersListWidget({
    super.key,
    required this.hasReachedMax,
    required this.wallpapers,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return buildWallpapers(hasReachedMax, wallpapers);
  }

  BaseGridView buildWallpapers(
    bool hasReachedMax,
    List<WallpaperModel> wallpapers,
  ) {
    return BaseGridView(
      controller: controller,
      itemCount: hasReachedMax ? wallpapers.length : wallpapers.length + 1,
      itemBuilder: (context, index) {
        if (index >= wallpapers.length) {
          return const BottomLoader();
        }
        final wallpaper = wallpapers[index];
        final aspectRatio = wallpaper.dimensionX / wallpaper.dimensionY;

        return AspectRatio(
          aspectRatio: aspectRatio,
          child: WallpaperCard(
            wallpaper: wallpaper,
          ),
        );
      },
    );
  }
}
