part of 'single_wallpaper_bloc.dart';

abstract class SingleWallpaperEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchSingleWallpaper extends SingleWallpaperEvent {
  final String id;

  FetchSingleWallpaper({required this.id});
}
