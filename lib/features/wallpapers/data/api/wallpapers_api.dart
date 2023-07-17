import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:slash/core/api_provider.dart';
import 'package:slash/core/failure.dart';
import 'package:slash/injection_container.dart';

import '../models/full_wallpaper_model.dart';
import '../models/wallpaper_model.dart';

Future<Either<Failure, List<WallpaperModel>>> getWallpapers(int page) async {
  Future<List<WallpaperModel>> wallpapersFetch() async {
    final ans = await sl<Dio>().get('/v1/search', queryParameters: {
      "page": page,
    });

    final wallpapers = List<WallpaperModel>.from(
      ans.data['data'].map(
        (x) => WallpaperModel.fromJson(x),
      ),
    );

    return wallpapers;
  }

  return fetcher<List<WallpaperModel>>(() => wallpapersFetch());
}

Future<Either<Failure, FullWallpaperModel>> getFullWallpaper(String id) async {
  Future<FullWallpaperModel> wallpaperFetch() async {
    final ans = await sl<Dio>().get('/v1/w/$id');

    final wallpaper = FullWallpaperModel.fromJson(ans.data['data']);

    return wallpaper;
  }

  return fetcher<FullWallpaperModel>(() => wallpaperFetch());
}
