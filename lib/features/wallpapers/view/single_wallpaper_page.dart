import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/features/wallpapers/controller/single_wallpaper_bloc/single_wallpaper_bloc.dart';
import 'package:slash/features/wallpapers/data/repository/wallpaper_repository_interface.dart';
import 'package:slash/features/wallpapers/view/widgets/single_wallpaper_page_content/single_wallpaper_page_content.dart';
import 'package:slash/injection_container.dart';

@RoutePage()
class SingleWallpaperPage extends StatefulWidget {
  const SingleWallpaperPage({
    @PathParam('wallpaperId') required this.wallpaperId,
    required this.previewImagePath,
  });

  final String wallpaperId;
  final String previewImagePath;

  @override
  State<SingleWallpaperPage> createState() => _SingleWallpaperPageState();
}

class _SingleWallpaperPageState extends State<SingleWallpaperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SingleWallpaperBloc(
          repository: sl<WallpaperRepositoryInterface>(),
        )..add(
            FetchSingleWallpaper(
              id: widget.wallpaperId,
            ),
          ),
        child: BlocBuilder<SingleWallpaperBloc, SingleWallpaperState>(
          builder: (context, state) {
            return SingleWallpaperPageContent(
              state: state,
              id: widget.wallpaperId,
              previewImagePath: widget.previewImagePath,
            );
          },
        ),
      ),
    );
  }
}
