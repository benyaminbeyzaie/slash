import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:slash/core/api_provider.dart';
import 'package:slash/core/failure.dart';
import 'package:slash/models/full_wallpaper_model.dart';
import 'package:slash/models/wallpaper_model.dart';
import 'package:slash/injection_container.dart';

Future<Either<Failure, List<WallpaperModel>>> getWallpapers(int page) async {
  Future<List<WallpaperModel>> fetch() async {
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

  return fetcher<List<WallpaperModel>>(() => fetch());
}

Future<Either<Failure, FullWallpaperModel>> getFullWallpaper(String id) async {
  Future<FullWallpaperModel> fetch() async {
    final ans = await sl<Dio>().get('/v1/w/$id');

    final wallpaper = FullWallpaperModel.fromJson(ans.data['data']);

    return wallpaper;
  }

  return fetcher<FullWallpaperModel>(() => fetch());
}
