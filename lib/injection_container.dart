import 'package:get_it/get_it.dart';

import 'router/app_router.dart';

final sl = GetIt.instance;

void init() {
  sl.registerSingleton<AppRouter>(AppRouter());
}
