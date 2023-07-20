import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:slash/core/failure.dart';
import 'package:slash/features/liked_wallpapers/data/liked_wallpapers_repository_interface.dart';
import 'package:slash/models/wallpaper_model.dart';

const kBoxName = "kLikedWallpapersKey";

class LikedWallpapersRepository implements LikedWallpapersRepositoryInterface {
  final Box<WallpaperModel> box;

  LikedWallpapersRepository({required this.box});

  @override
  Future<Either<Failure, bool>> add(
    WallpaperModel wallpaperModel,
  ) async {
    if (box.containsKey(wallpaperModel.id)) {
      return const Left(Failure(message: "The wallpaper is already in there!"));
    }

    await box.put(wallpaperModel.id, wallpaperModel);

    return const Right(true);
  }

  @override
  Future<Either<Failure, bool>> delete(String id) async {
    if (!box.containsKey(id)) {
      return Left(Failure(message: "There is no wallpaper with id: $id"));
    }

    await box.delete(id);

    return const Right(true);
  }

  @override
  Future<Either<Failure, List<WallpaperModel>>> reload() async {
    try {
      final values = box.values;
      final wallpapers = values.toList(growable: false);

      return Right(wallpapers);
    } catch (e) {
      return const Left(Failure(message: "Error"));
    }
  }
}
