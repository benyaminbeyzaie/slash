import 'package:dartz/dartz.dart';
import 'package:slash/core/failure.dart';
import 'package:slash/models/wallpaper_model.dart';

abstract class LikedWallpapersRepositoryInterface {
  Future<Either<Failure, List<WallpaperModel>>> reload();
  Future<Either<Failure, void>> add(WallpaperModel wallpaperModel);
  Future<Either<Failure, void>> delete(String id);
}
