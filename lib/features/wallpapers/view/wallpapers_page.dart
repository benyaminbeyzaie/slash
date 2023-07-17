import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:slash/features/wallpapers/view/widgets/bottom_loader.dart';
import 'package:slash/features/wallpapers/view/widgets/wallpaper_card.dart';
import 'package:slash/injection_container.dart';

import '../controller/wallpapers_bloc/wallpapers_bloc.dart';

@RoutePage()
class WallpapersPage extends StatefulWidget {
  const WallpapersPage({super.key});

  @override
  State<WallpapersPage> createState() => _WallpapersPageState();
}

class _WallpapersPageState extends State<WallpapersPage> {
  @override
  void initState() {
    sl<WallpapersBloc>().add(FetchNextWallpapers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WallpapersBloc, WallpapersState>(
        builder: (context, state) {
          var wallpapers = state.wallpapers;

          return MasonryGridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            itemCount:
                state.hasReachedMax ? wallpapers.length : wallpapers.length + 1,
            itemBuilder: (context, index) {
              if (index >= wallpapers.length) {
                return const AspectRatio(
                  aspectRatio: 2,
                  child: BottomLoader(),
                );
              }
              final wallpaper = wallpapers[index];
              final aspectRatio = wallpaper.dimensionY / wallpaper.dimensionX;

              return AspectRatio(
                aspectRatio: aspectRatio,
                child: const WallpaperCard(),
              );
            },
          );
        },
      ),
    );
  }
}
