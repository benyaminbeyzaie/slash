import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../data/models/wallpaper_model.dart';
import '../../data/repository/wallpaper_repository_interface.dart';

part 'wallpapers_event.dart';
part 'wallpapers_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class WallpapersBloc extends Bloc<WallpapersEvent, WallpapersState> {
  final WallpaperRepositoryInterface repository;

  WallpapersBloc({
    required this.repository,
  }) : super(const WallpapersState()) {
    on<FetchNextWallpapers>(
      _onFetchWallpapers,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onFetchWallpapers(
    FetchNextWallpapers event,
    Emitter<WallpapersState> emit,
  ) async {
    if (state.hasReachedMax) return;

    if (state.status == WallpapersStateStatus.initial) {
      final ans = await repository.fetchWallpapers(state.page);

      ans.fold(
        (l) => emit(
          state.copyWith(
            status: WallpapersStateStatus.failure,
            message: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(
            status: WallpapersStateStatus.success,
            wallpapers: r,
            hasReachedMax: false,
            message: 'success',
          ),
        ),
      );

      return;
    }
    final ans = await repository.fetchWallpapers(state.page + 1);

    ans.fold(
      (l) => emit(
        state.copyWith(
          status: WallpapersStateStatus.failure,
          message: l.message,
        ),
      ),
      (r) => emit(
        r.isEmpty
            ? state.copyWith(
                hasReachedMax: true,
                message: 'success, ended',
              )
            : state.copyWith(
                status: WallpapersStateStatus.success,
                wallpapers: List.of(state.wallpapers)..addAll(r),
                hasReachedMax: false,
                page: state.page + 1,
                message: 'success',
              ),
      ),
    );
  }
}
