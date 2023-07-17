part of 'wallpapers_bloc.dart';

class WallpapersState extends Equatable {
  final WallpapersStateStatus status;
  final List<WallpaperModel> wallpapers;
  final bool hasReachedMax;
  final String message;
  final int page;

  const WallpapersState({
    this.status = WallpapersStateStatus.initial,
    this.wallpapers = const <WallpaperModel>[],
    this.hasReachedMax = false,
    this.message = "empty",
    this.page = 1,
  });

  WallpapersState copyWith({
    WallpapersStateStatus? status,
    List<WallpaperModel>? wallpapers,
    bool? hasReachedMax,
    String? message,
    int? page,
  }) {
    return WallpapersState(
      status: status ?? this.status,
      wallpapers: wallpapers ?? this.wallpapers,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      message: message ?? this.message,
      page: page ?? this.page,
    );
  }

  @override
  String toString() {
    return '''WallpapersState { status: $status, page: $page, message: $message,  hasReachedMax: $hasReachedMax, wallpapers: ${wallpapers.length} }''';
  }

  @override
  List<Object> get props => [status, page, wallpapers, hasReachedMax, message];
}

enum WallpapersStateStatus { initial, success, failure }
