import 'package:flutter/material.dart';
import 'package:slash/features/wallpapers/controller/wallpapers_bloc/wallpapers_bloc.dart';
import 'package:slash/widgets/empty_indicator.dart';
import 'package:slash/widgets/error_indicator.dart';

import '../../data/models/wallpaper_model.dart';
import 'bottom_loader.dart';
import 'grid_view/base_grid_view.dart';
import 'grid_view/grid_view_skeleton.dart';
import 'wallpaper_card/wallpaper_card.dart';

class WallpapersPageContent extends StatelessWidget {
  final WallpapersState state;
  final ScrollController? scrollController;

  const WallpapersPageContent({
    super.key,
    required this.state,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    if (state.status == WallpapersStateStatus.initial) {
      return const GridViewSkeleton();
    }
    final wallpapers = state.wallpapers;

    if (wallpapers.isEmpty) {
      return const Center(child: EmptyIndicator());
    }

    if (state.status == WallpapersStateStatus.failure) {
      return const Center(child: ErrorIndicator());
    }

    return buildWallpapers(state.hasReachedMax, wallpapers);
  }

  BaseGridView buildWallpapers(
    bool hasReachedMax,
    List<WallpaperModel> wallpapers,
  ) {
    return BaseGridView(
      controller: scrollController,
      itemCount: hasReachedMax ? wallpapers.length : wallpapers.length + 1,
      itemBuilder: (context, index) {
        if (index >= wallpapers.length) {
          return const BottomLoader();
        }
        final wallpaper = wallpapers[index];
        final aspectRatio = wallpaper.dimensionX / wallpaper.dimensionY;
        final imagePath = wallpaper.path;

        return AspectRatio(
          aspectRatio: aspectRatio,
          child: WallpaperCard(imagePath: imagePath),
        );
      },
    );
  }
}
