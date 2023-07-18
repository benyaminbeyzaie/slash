import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:slash/features/wallpapers/controller/wallpapers_bloc/wallpapers_bloc.dart';
import 'package:slash/features/wallpapers/data/repository/wallpaper_repository.dart';
import 'package:slash/features/wallpapers/data/repository/wallpaper_repository_interface.dart';

import 'core/api_provider.dart';
import 'router/app_router.dart';

final sl = GetIt.instance;

void init() {
  sl.registerSingleton<Dio>(createDio());
  sl.registerSingleton<AppRouter>(AppRouter());

  sl.registerLazySingleton<WallpaperRepositoryInterface>(
    () => WallpaperRepository(),
  );

  sl.registerLazySingleton<WallpapersBloc>(
    () => WallpapersBloc(
      repository: sl<WallpaperRepositoryInterface>(),
    ),
  );

  sl.registerSingleton<BaseCacheManager>(
    DefaultCacheManager(),
  );
}
