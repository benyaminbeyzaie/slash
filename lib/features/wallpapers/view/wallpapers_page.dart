import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/features/wallpapers/data/models/wallpaper_model.dart';
import 'package:slash/features/wallpapers/view/widgets/bottom_loader.dart';
import 'package:slash/features/wallpapers/view/widgets/grid_view/base_grid_view.dart';
import 'package:slash/features/wallpapers/view/widgets/wallpaper_card/wallpaper_card.dart';
import 'package:slash/injection_container.dart';
import 'package:slash/widgets/empty_indicator.dart';
import 'package:slash/widgets/error_indicator.dart';

import '../controller/wallpapers_bloc/wallpapers_bloc.dart';
import 'widgets/grid_view/grid_view_skeleton.dart';

@RoutePage()
class WallpapersPage extends StatefulWidget {
  const WallpapersPage({super.key});

  @override
  State<WallpapersPage> createState() => _WallpapersPageState();
}

class _WallpapersPageState extends State<WallpapersPage> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScroll);
    sl<WallpapersBloc>().add(FetchNextWallpapers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("/ slash"),
      ),
      body: BlocBuilder<WallpapersBloc, WallpapersState>(
        builder: (context, state) {
          if (state.status == WallpapersStateStatus.initial) {
            return const GridViewSkeleton();
          }
          final wallpapers = state.wallpapers;

          if (wallpapers.isEmpty) {
            return const Center(child: EmptyIndicator());
          }

          if (state.status == WallpapersStateStatus.failure) {
            return const Center(child: ErrorIndicator());
          }

          return buildWallpapers(state.hasReachedMax, wallpapers);
        },
      ),
    );
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(onScroll)
      ..dispose();
    super.dispose();
  }

  BaseGridView buildWallpapers(
    bool hasReachedMax,
    List<WallpaperModel> wallpapers,
  ) {
    return BaseGridView(
      controller: scrollController,
      itemCount: hasReachedMax ? wallpapers.length : wallpapers.length + 1,
      itemBuilder: (context, index) {
        if (index >= wallpapers.length) {
          return const BottomLoader();
        }
        final wallpaper = wallpapers[index];
        final aspectRatio = wallpaper.dimensionX / wallpaper.dimensionY;
        final imagePath = wallpaper.path;

        return AspectRatio(
          aspectRatio: aspectRatio,
          child: WallpaperCard(imagePath: imagePath),
        );
      },
    );
  }

  void onScroll() {
    if (isBottom) context.read<WallpapersBloc>().add(FetchNextWallpapers());
  }

  bool get isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;

    return currentScroll >= (maxScroll * 0.9);
  }
}
