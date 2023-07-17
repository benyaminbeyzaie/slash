part of 'wallpapers_bloc.dart';

abstract class WallpapersEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchWallpapers extends WallpapersEvent {
  final int page;

  FetchWallpapers({required this.page});
}
