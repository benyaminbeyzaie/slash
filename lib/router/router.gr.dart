// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:slash/features/wallpapers/single-wallpaper/single_wallpaper_page.dart' as _i2;
import 'package:slash/features/wallpapers/wallpapers_page.dart' as _i1;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    WallpapersRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.WallpapersPage(),
      );
    },
    SingleWallpaperRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SingleWallpaperRouteArgs>(
          orElse: () => SingleWallpaperRouteArgs(
              wallpaperId: pathParams.getString('wallpaperId')));
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.SingleWallpaperPage(wallpaperId: args.wallpaperId),
      );
    },
  };
}

/// generated route for
/// [_i1.WallpapersPage]
class WallpapersRoute extends _i3.PageRouteInfo<void> {
  const WallpapersRoute({List<_i3.PageRouteInfo>? children})
      : super(
          WallpapersRoute.name,
          initialChildren: children,
        );

  static const String name = 'WallpapersRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SingleWallpaperPage]
class SingleWallpaperRoute extends _i3.PageRouteInfo<SingleWallpaperRouteArgs> {
  SingleWallpaperRoute({
    required String wallpaperId,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          SingleWallpaperRoute.name,
          args: SingleWallpaperRouteArgs(wallpaperId: wallpaperId),
          rawPathParams: {'wallpaperId': wallpaperId},
          initialChildren: children,
        );

  static const String name = 'SingleWallpaperRoute';

  static const _i3.PageInfo<SingleWallpaperRouteArgs> page =
      _i3.PageInfo<SingleWallpaperRouteArgs>(name);
}

class SingleWallpaperRouteArgs {
  const SingleWallpaperRouteArgs({required this.wallpaperId});

  final String wallpaperId;

  @override
  String toString() {
    return 'SingleWallpaperRouteArgs{wallpaperId: $wallpaperId}';
  }
}
