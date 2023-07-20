import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/features/liked_wallpapers/controller/bloc/liked_wallpapers_bloc.dart';
import 'package:slash/widgets/wallpapers_list_widget.dart';

@RoutePage()
class LikedWallpapersPage extends StatelessWidget {
  const LikedWallpapersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikedWallpapersBloc, LikedWallpapersState>(
      builder: (context, state) {
        return WallpapersListWidget(
          hasReachedMax: true,
          wallpapers: state.likedWallpaperModels ?? [],
        );
      },
    );
  }
}
