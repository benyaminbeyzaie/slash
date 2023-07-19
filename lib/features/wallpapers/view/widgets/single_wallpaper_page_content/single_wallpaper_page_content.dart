import 'package:flutter/material.dart';
import 'package:slash/features/wallpapers/controller/single_wallpaper_bloc/single_wallpaper_bloc.dart';
import 'package:slash/features/wallpapers/view/widgets/single_wallpaper_page_content/async_single_wallpaper_page_content.dart';
import 'package:slash/features/wallpapers/view/widgets/single_wallpaper_page_content/sync_single_wallpaper_page_content.dart';

class SingleWallpaperPageContent extends StatelessWidget {
  final SingleWallpaperState state;
  final String id;
  final String? previewImagePath;

  const SingleWallpaperPageContent({
    super.key,
    required this.state,
    required this.id,
    this.previewImagePath,
  });

  @override
  Widget build(BuildContext context) {
    final imagePath = previewImagePath;
    if (imagePath == null) {
      return AsyncSingleWallpaperPageContent(
        state: state,
        id: id,
      );
    }

    return SyncSingleWallpaperPageContent(
      state: state,
      id: id,
      previewImagePath: imagePath,
    );
  }
}
