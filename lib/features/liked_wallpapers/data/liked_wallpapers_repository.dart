import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slash/core/failure.dart';
import 'package:slash/features/liked_wallpapers/data/liked_wallpapers_repository_interface.dart';
import 'package:slash/models/wallpaper_model.dart';

const kLikedWallpapersKey = "kLikedWallpapersKey";

class LikedWallpapersRepository implements LikedWallpapersRepositoryInterface {
  final SharedPreferences sharedPreferences;

  LikedWallpapersRepository({required this.sharedPreferences});

  @override
  Future<Either<Failure, bool>> add(
    WallpaperModel wallpaperModel,
  ) async {
    if (sharedPreferences.containsKey(wallpaperModel.id)) {
      return const Left(Failure(message: "The wallpaper is already in there!"));
    }

    await sharedPreferences.setString(
      wallpaperModel.id,
      json.encode(wallpaperModel.toJson()),
    );

    return const Right(true);
  }

  @override
  Future<Either<Failure, bool>> delete(String id) async {
    if (!sharedPreferences.containsKey(id)) {
      return Left(Failure(message: "There is no wallpaper with id: $id"));
    }

    await sharedPreferences.remove(id);

    return const Right(true);
  }

  @override
  Future<Either<Failure, List<WallpaperModel>>> reload() async {
    try {
      await sharedPreferences.reload();
      final keys = sharedPreferences.getKeys();
      final wallpapers = keys.map((key) {
        final data = sharedPreferences.getString(key);
        if (data == null) return const Left(Failure(message: "Error"));
        final wallpaperModel = WallpaperModel.fromJson(json.decode(data));

        return wallpaperModel;
      }).toList(growable: false) as List<WallpaperModel>;

      return Right(wallpapers);
    } catch (e) {
      return const Left(Failure(message: "Error"));
    }
  }
}
