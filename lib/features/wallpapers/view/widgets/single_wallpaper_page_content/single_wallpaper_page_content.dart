import 'package:flutter/material.dart';
import 'package:slash/features/wallpapers/controller/single_wallpaper_bloc/single_wallpaper_bloc.dart';
import 'package:slash/features/wallpapers/view/widgets/single_wallpaper_page_content/async_single_wallpaper_page_content.dart';
import 'package:slash/features/wallpapers/view/widgets/single_wallpaper_page_content/sync_single_wallpaper_page_content.dart';
import 'package:slash/models/wallpaper_model.dart';

class SingleWallpaperPageContent extends StatelessWidget {
  final SingleWallpaperState state;
  final String id;
  final WallpaperModel? wallpaperModel;

  const SingleWallpaperPageContent({
    super.key,
    required this.state,
    required this.id,
    this.wallpaperModel,
  });

  @override
  Widget build(BuildContext context) {
    if (wallpaperModel == null) {
      return AsyncSingleWallpaperPageContent(
        state: state,
        id: id,
      );
    }

    return SyncSingleWallpaperPageContent(
      state: state,
      wallpaperModel: wallpaperModel!,
    );
  }
}
