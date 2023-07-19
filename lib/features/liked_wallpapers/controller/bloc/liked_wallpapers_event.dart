part of 'liked_wallpapers_bloc.dart';

abstract class LikedWallpapersEvent {}

class ReloadWallpapers extends LikedWallpapersEvent {}

class LikeWallpaper extends LikedWallpapersEvent {
  final WallpaperModel wallpaperModel;

  LikeWallpaper({required this.wallpaperModel});
}

class DeleteLikedWallpaper extends LikedWallpapersEvent {
  final String id;

  DeleteLikedWallpaper({required this.id});
}

class DeleteAll extends LikedWallpapersEvent {}
