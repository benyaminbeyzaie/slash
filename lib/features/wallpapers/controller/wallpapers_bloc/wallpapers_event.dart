part of 'wallpapers_bloc.dart';

abstract class WallpapersEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchNextWallpapers extends WallpapersEvent {
  FetchNextWallpapers();
}
