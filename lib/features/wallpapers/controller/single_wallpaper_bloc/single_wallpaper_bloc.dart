import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:slash/features/shared/repositories/wallpaper_repository_interface.dart';
import 'package:slash/models/full_wallpaper_model.dart';

part 'single_wallpaper_event.dart';
part 'single_wallpaper_state.dart';

class SingleWallpaperBloc
    extends Bloc<SingleWallpaperEvent, SingleWallpaperState> {
  final WallpaperRepositoryInterface repository;

  SingleWallpaperBloc({
    required this.repository,
  }) : super(const SingleWallpaperState()) {
    on<FetchSingleWallpaper>(_onFetchSingleWallpaper);
  }

  Future<void> _onFetchSingleWallpaper(
    FetchSingleWallpaper event,
    Emitter<SingleWallpaperState> emit,
  ) async {
    if (state.status == SingleWallpaperStateStatus.success ||
        state.status == SingleWallpaperStateStatus.loading) return;

    final ans = await repository.fetchSingleWallpaper(event.id);

    ans.fold(
      (l) => emit(
        state.copyWith(
          status: SingleWallpaperStateStatus.failure,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: SingleWallpaperStateStatus.success,
          message: 'success',
          fullWallpaperModel: r,
        ),
      ),
    );
  }
}
