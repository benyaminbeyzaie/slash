import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../data/api/wallpapers_api.dart';

@RoutePage()
class WallpapersPage extends StatelessWidget {
  const WallpapersPage({super.key});

  @override
  Widget build(BuildContext context) {
    getWallpapers(1);
    getWallpapers(2);

    return const Placeholder(
      child: Text("Home"),
    );
  }
}
