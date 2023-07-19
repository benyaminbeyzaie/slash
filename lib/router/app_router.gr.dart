// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:slash/features/home/views/home_page.dart' as _i4;
import 'package:slash/features/liked_wallpapers/view/liked_wallpapers_page.dart'
    as _i1;
import 'package:slash/features/wallpapers/view/single_wallpaper_page.dart'
    as _i3;
import 'package:slash/features/wallpapers/view/wallpapers_page.dart' as _i2;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LikedWallpapersRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LikedWallpapersPage(),
      );
    },
    WallpapersRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.WallpapersPage(),
      );
    },
    SingleWallpaperRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SingleWallpaperRouteArgs>(
          orElse: () => SingleWallpaperRouteArgs(
              wallpaperId: pathParams.getString('wallpaperId')));
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.SingleWallpaperPage(
          wallpaperId: args.wallpaperId,
          previewImagePath: args.previewImagePath,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.LikedWallpapersPage]
class LikedWallpapersRoute extends _i5.PageRouteInfo<void> {
  const LikedWallpapersRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LikedWallpapersRoute.name,
          initialChildren: children,
        );

  static const String name = 'LikedWallpapersRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.WallpapersPage]
class WallpapersRoute extends _i5.PageRouteInfo<void> {
  const WallpapersRoute({List<_i5.PageRouteInfo>? children})
      : super(
          WallpapersRoute.name,
          initialChildren: children,
        );

  static const String name = 'WallpapersRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SingleWallpaperPage]
class SingleWallpaperRoute extends _i5.PageRouteInfo<SingleWallpaperRouteArgs> {
  SingleWallpaperRoute({
    required String wallpaperId,
    String? previewImagePath,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          SingleWallpaperRoute.name,
          args: SingleWallpaperRouteArgs(
            wallpaperId: wallpaperId,
            previewImagePath: previewImagePath,
          ),
          rawPathParams: {'wallpaperId': wallpaperId},
          initialChildren: children,
        );

  static const String name = 'SingleWallpaperRoute';

  static const _i5.PageInfo<SingleWallpaperRouteArgs> page =
      _i5.PageInfo<SingleWallpaperRouteArgs>(name);
}

class SingleWallpaperRouteArgs {
  const SingleWallpaperRouteArgs({
    required this.wallpaperId,
    this.previewImagePath,
  });

  final String wallpaperId;

  final String? previewImagePath;

  @override
  String toString() {
    return 'SingleWallpaperRouteArgs{wallpaperId: $wallpaperId, previewImagePath: $previewImagePath}';
  }
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
