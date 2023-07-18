import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/features/wallpapers/controller/single_wallpaper_bloc/single_wallpaper_bloc.dart';
import 'package:slash/features/wallpapers/data/repository/wallpaper_repository.dart';
import 'package:slash/injection_container.dart';
import 'package:slash/widgets/slashed_network_image.dart';

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
          repository: sl<WallpaperRepository>(),
        )..add(
            FetchSingleWallpaper(
              id: widget.wallpaperId,
            ),
          ),
        child: BlocBuilder<SingleWallpaperBloc, SingleWallpaperState>(
          builder: (context, state) {
            return ListView(
              children: [
                Hero(
                  tag: widget.wallpaperId,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child:
                        SlashedNetworkImage(imageUrl: widget.previewImagePath),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
