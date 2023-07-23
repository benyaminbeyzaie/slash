import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/features/liked_wallpapers/data/liked_wallpapers_repository_interface.dart';
import 'package:slash/features/shared/repositories/wallpaper_repository_interface.dart';
import 'package:slash/models/wallpaper_model.dart';

part 'liked_wallpapers_event.dart';
part 'liked_wallpapers_state.dart';

class LikedWallpapersBloc
    extends Bloc<LikedWallpapersEvent, LikedWallpapersState> {
  final LikedWallpapersRepositoryInterface likedRepository;
  final WallpaperRepositoryInterface wallpapersRepository;

  LikedWallpapersBloc({
    required this.likedRepository,
    required this.wallpapersRepository,
  }) : super(
          const LikedWallpapersState(
            status: LikedWallpapersStateStatus.initial,
          ),
        ) {
    on<ReloadWallpapers>((event, emit) async {
      emit(
        const LikedWallpapersState(status: LikedWallpapersStateStatus.updating),
      );

      final ans = await likedRepository.reload();

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

      final ans = await likedRepository.add(event.wallpaperModel);

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

    on<LikeWallpaperWithId>((event, emit) async {
      emit(
        const LikedWallpapersState(status: LikedWallpapersStateStatus.updating),
      );

      final wallpaperModel = wallpapersRepository.cache
          ?.firstWhere((element) => element.id == event.id);

      if (wallpaperModel == null) return;

      final ans = await likedRepository.add(wallpaperModel);

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

      final ans = await likedRepository.delete(event.id);

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
