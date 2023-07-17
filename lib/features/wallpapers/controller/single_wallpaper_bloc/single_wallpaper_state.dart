part of 'single_wallpaper_bloc.dart';

class SingleWallpaperState extends Equatable {
  const SingleWallpaperState({
    this.fullWallpaperModel,
    this.status = SingleWallpaperStateStatus.initial,
    this.message = "empty",
  });

  final FullWallpaperModel? fullWallpaperModel;
  final SingleWallpaperStateStatus status;
  final String? message;

  SingleWallpaperState copyWith({
    SingleWallpaperStateStatus? status,
    FullWallpaperModel? fullWallpaperModel,
    String? message,
  }) {
    return SingleWallpaperState(
      status: status ?? this.status,
      fullWallpaperModel: fullWallpaperModel ?? this.fullWallpaperModel,
      message: message,
    );
  }

  @override
  List<Object> get props => [status, fullWallpaperModel ?? 0, message ?? 0];
}

enum SingleWallpaperStateStatus {
  initial,
  loading,
  success,
  failure,
}
