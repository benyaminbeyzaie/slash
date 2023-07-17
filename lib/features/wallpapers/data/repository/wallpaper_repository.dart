import 'package:dartz/dartz.dart';
import 'package:slash/core/failure.dart';
import 'package:slash/features/wallpapers/data/models/full_wallpaper_model.dart';
import 'package:slash/features/wallpapers/data/models/wallpaper_model.dart';
import 'package:slash/features/wallpapers/data/repository/wallpaper_repository_interface.dart';

import '../api/wallpapers_api.dart';

class WallpaperRepository implements WallpaperRepositoryInterface {
  @override
  Future<Either<Failure, FullWallpaperModel>> fetchSingleWallpaper(String id) {
    return getFullWallpaper(id);
  }

  @override
  Future<Either<Failure, List<WallpaperModel>>> fetchWallpapers(int page) {
    return getWallpapers(page);
  }
}
