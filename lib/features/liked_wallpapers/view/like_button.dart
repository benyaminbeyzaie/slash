import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/features/liked_wallpapers/controller/bloc/liked_wallpapers_bloc.dart';
import 'package:slash/models/wallpaper_model.dart';

class LikeButton extends StatelessWidget {
  final WallpaperModel wallpaper;

  const LikeButton({
    super.key,
    required this.wallpaper,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikedWallpapersBloc, LikedWallpapersState>(
      builder: (context, state) {
        return IconButton(
          onPressed: toggleLikeBasedOnState(context, state, wallpaper),
          icon: Icon(buildIconBasedOnState(state, wallpaper)),
        );
      },
    );
  }

  void Function()? toggleLikeBasedOnState(
    BuildContext context,
    LikedWallpapersState state,
    WallpaperModel wallpaper,
  ) {
    final likedWallpapers = state.likedWallpaperModels;

    if (state.status == LikedWallpapersStateStatus.updating ||
        likedWallpapers == null) {
      return null;
    }

    return () {
      if (likedWallpapers.contains(wallpaper)) {
        BlocProvider.of<LikedWallpapersBloc>(context).add(DeleteLikedWallpaper(
          id: wallpaper.id,
        ));

        return;
      }
      BlocProvider.of<LikedWallpapersBloc>(context).add(LikeWallpaper(
        wallpaperModel: wallpaper,
      ));
    };
  }

  IconData buildIconBasedOnState(
    LikedWallpapersState state,
    WallpaperModel wallpaper,
  ) {
    final likedWallpapers = state.likedWallpaperModels;

    if (state.status == LikedWallpapersStateStatus.updating ||
        likedWallpapers == null) {
      return Icons.accessible_forward_sharp;
    }

    if (likedWallpapers.contains(wallpaper)) {
      return Icons.favorite_border;
    }

    return Icons.favorite;
  }
}
