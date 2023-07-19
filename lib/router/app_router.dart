import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: "/",
          page: HomeRoute.page,
          initial: true,
          fullMatch: true,
          children: [
            RedirectRoute(path: '', redirectTo: 'wallpapers'),
            AutoRoute(
              path: "wallpapers",
              page: WallpapersRoute.page,
            ),
            AutoRoute(
              path: "liked",
              page: LikedWallpapersRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: "/wallpapers/liked",
          page: LikedWallpapersRoute.page,
          fullMatch: true,
        ),
        AutoRoute(
          path: '/wallpapers/:wallpaperId',
          page: SingleWallpaperRoute.page,
        ),
        RedirectRoute(
          path: '*',
          redirectTo: '/',
        ),
      ];
}
