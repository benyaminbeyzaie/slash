import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SingleWallpaperPage extends StatelessWidget {
  const SingleWallpaperPage({
    @PathParam('wallpaperId') required this.wallpaperId,
  });

  final String wallpaperId;

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Text("Wallpaper details page: $wallpaperId"),
    );
  }
}
