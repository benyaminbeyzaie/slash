import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slash/features/liked_wallpapers/controller/bloc/liked_wallpapers_bloc.dart';
import 'package:slash/features/liked_wallpapers/data/liked_wallpapers_repository.dart';
import 'package:slash/features/liked_wallpapers/data/liked_wallpapers_repository_interface.dart';
import 'package:slash/features/wallpapers/controller/wallpapers_bloc/wallpapers_bloc.dart';
import 'package:slash/features/wallpapers/data/repository/wallpaper_repository.dart';
import 'package:slash/features/wallpapers/data/repository/wallpaper_repository_interface.dart';

import 'core/api_provider.dart';
import 'router/app_router.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();

  sl.registerSingleton<Dio>(createDio());
  sl.registerSingleton<AppRouter>(AppRouter());

  sl.registerLazySingleton<WallpaperRepositoryInterface>(
    () => WallpaperRepository(),
  );

  sl.registerLazySingleton<LikedWallpapersRepositoryInterface>(
    () => LikedWallpapersRepository(sharedPreferences: preferences),
  );

  sl.registerLazySingleton<WallpapersBloc>(
    () => WallpapersBloc(
      repository: sl<WallpaperRepositoryInterface>(),
    ),
  );

  sl.registerLazySingleton<LikedWallpapersBloc>(
    () => LikedWallpapersBloc(
      repository: sl<LikedWallpapersRepositoryInterface>(),
    ),
  );

  sl.registerSingleton<BaseCacheManager>(
    DefaultCacheManager(),
  );
}
