import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: "/wallpapers",
          page: WallpapersRoute.page,
          initial: true,
          fullMatch: true,
        ),
        AutoRoute(
          path: '/wallpapers/:wallpaperId',
          page: SingleWallpaperRoute.page,
        ),
        RedirectRoute(
          path: '*',
          redirectTo: '/wallpapers',
        ),
      ];
}
