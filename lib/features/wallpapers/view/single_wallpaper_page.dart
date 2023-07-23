import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/features/shared/repositories/wallpaper_repository_interface.dart';
import 'package:slash/features/wallpapers/controller/single_wallpaper_bloc/single_wallpaper_bloc.dart';
import 'package:slash/features/wallpapers/view/widgets/single_wallpaper_page_content/single_wallpaper_page_content.dart';
import 'package:slash/injection_container.dart';
import 'package:slash/models/wallpaper_model.dart';

@RoutePage()
class SingleWallpaperPage extends StatelessWidget {
  const SingleWallpaperPage({
    @PathParam('wallpaperId') required this.wallpaperId,
    this.wallpaperModel,
  });

  final String wallpaperId;
  final WallpaperModel? wallpaperModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SingleWallpaperBloc(
          repository: sl<WallpaperRepositoryInterface>(),
        )..add(
            FetchSingleWallpaper(
              id: wallpaperId,
            ),
          ),
        child: BlocBuilder<SingleWallpaperBloc, SingleWallpaperState>(
          builder: (context, state) {
            return SingleWallpaperPageContent(
              state: state,
              id: wallpaperId,
              wallpaperModel: wallpaperModel,
            );
          },
        ),
      ),
    );
  }
}
