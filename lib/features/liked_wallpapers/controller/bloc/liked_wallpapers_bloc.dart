import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/features/liked_wallpapers/data/liked_wallpapers_repository_interface.dart';
import 'package:slash/models/wallpaper_model.dart';

part 'liked_wallpapers_event.dart';
part 'liked_wallpapers_state.dart';

class LikedWallpapersBloc
    extends Bloc<LikedWallpapersEvent, LikedWallpapersState> {
  final LikedWallpapersRepositoryInterface repository;

  LikedWallpapersBloc({required this.repository})
      : super(
          const LikedWallpapersState(
            status: LikedWallpapersStateStatus.initial,
          ),
        ) {
    on<ReloadWallpapers>((event, emit) async {
      emit(
        const LikedWallpapersState(status: LikedWallpapersStateStatus.updating),
      );

      final ans = await repository.reload();

      ans.fold(
        (l) => emit(
          const LikedWallpapersState(
            status: LikedWallpapersStateStatus.error,
          ),
        ),
        (r) => emit(
          LikedWallpapersState(
            status: LikedWallpapersStateStatus.ready,
            likedWallpaperModels: r,
          ),
        ),
      );
    });

    on<LikeWallpaper>((event, emit) async {
      emit(
        const LikedWallpapersState(status: LikedWallpapersStateStatus.updating),
      );

      final ans = await repository.add(event.wallpaperModel);

      ans.fold(
        (l) => emit(
          const LikedWallpapersState(
            status: LikedWallpapersStateStatus.error,
          ),
        ),
        (r) => add(
          ReloadWallpapers(),
        ),
      );
    });

    on<DeleteLikedWallpaper>((event, emit) async {
      emit(
        const LikedWallpapersState(status: LikedWallpapersStateStatus.updating),
      );

      final ans = await repository.delete(event.id);

      ans.fold(
        (l) => emit(
          const LikedWallpapersState(
            status: LikedWallpapersStateStatus.error,
          ),
        ),
        (r) => add(
          ReloadWallpapers(),
        ),
      );
    });
  }
}
