import 'package:dartz/dartz.dart';
import 'package:slash/core/failure.dart';
import 'package:slash/features/wallpapers/data/models/full_wallpaper_model.dart';
import 'package:slash/features/wallpapers/data/models/wallpaper_model.dart';

abstract class WallpaperRepositoryInterface {
  Future<Either<Failure, List<WallpaperModel>>> fetchWallpapers(int page);
  Future<Either<Failure, FullWallpaperModel>> fetchSingleWallpaper(String id);
}
