import 'package:dartz/dartz.dart';
import 'package:slash/core/failure.dart';
import 'package:slash/features/shared/apis/wallpapers_api.dart';
import 'package:slash/models/full_wallpaper_model.dart';
import 'package:slash/models/wallpaper_model.dart';

import 'wallpaper_repository_interface.dart';

class WallpaperRepository implements WallpaperRepositoryInterface {
  @override
  List<WallpaperModel>? cache;

  @override
  Future<Either<Failure, FullWallpaperModel>> fetchSingleWallpaper(String id) {
    return getFullWallpaper(id);
  }

  @override
  Future<Either<Failure, List<WallpaperModel>>> fetchWallpapers(
    int page,
  ) async {
    final ans = await getWallpapers(page);

    if (ans.isRight()) {
      ans.foldRight(null, (r, previous) {
        if (page == 1) {
          cache = r;

          return;
        }
        cache?.addAll(r);
      });
    }

    return ans;
  }
}
