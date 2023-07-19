part of 'liked_wallpapers_bloc.dart';

class LikedWallpapersState {
  final List<WallpaperModel>? likedWallpaperModels;
  final LikedWallpapersStateStatus status;

  const LikedWallpapersState({
    this.likedWallpaperModels,
    required this.status,
  });
}

enum LikedWallpapersStateStatus {
  initial,
  ready,
  updating,
  error,
}
