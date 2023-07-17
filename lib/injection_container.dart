import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/api_provider.dart';
import 'router/app_router.dart';

final sl = GetIt.instance;

void init() {
  sl.registerSingleton<Dio>(createDio());
  sl.registerSingleton<AppRouter>(AppRouter());
}
