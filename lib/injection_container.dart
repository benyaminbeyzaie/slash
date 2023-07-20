import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:slash/features/liked_wallpapers/controller/bloc/liked_wallpapers_bloc.dart';
import 'package:slash/features/liked_wallpapers/data/liked_wallpapers_repository.dart';
import 'package:slash/features/liked_wallpapers/data/liked_wallpapers_repository_interface.dart';
import 'package:slash/features/wallpapers/controller/wallpapers_bloc/wallpapers_bloc.dart';
import 'package:slash/features/wallpapers/data/repository/wallpaper_repository.dart';
import 'package:slash/features/wallpapers/data/repository/wallpaper_repository_interface.dart';
import 'package:slash/models/thumbs_model.dart';
import 'package:slash/models/wallpaper_model.dart';

import 'core/api_provider.dart';
import 'router/app_router.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await Hive.initFlutter();
  Hive.registerAdapter(WallpaperModelAdapter());
  Hive.registerAdapter(ThumbsModelAdapter());

  final box = await Hive.openBox<WallpaperModel>('box');

  sl.registerSingleton<Dio>(createDio());
  sl.registerSingleton<AppRouter>(AppRouter());

  sl.registerLazySingleton<WallpaperRepositoryInterface>(
    () => WallpaperRepository(),
  );

  sl.registerLazySingleton<LikedWallpapersRepositoryInterface>(
    () => LikedWallpapersRepository(box: box),
  );

  sl.registerLazySingleton<WallpapersBloc>(
    () => WallpapersBloc(
      repository: sl<WallpaperRepositoryInterface>(),
    ),
  );

  sl.registerLazySingleton<LikedWallpapersBloc>(
    () => LikedWallpapersBloc(
      repository: sl<LikedWallpapersRepositoryInterface>(),
    )..add(ReloadWallpapers()),
  );

  sl.registerSingleton<BaseCacheManager>(
    DefaultCacheManager(),
  );
}
