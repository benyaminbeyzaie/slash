import 'package:flutter/material.dart';
import 'package:slash/features/wallpapers/controller/wallpapers_bloc/wallpapers_bloc.dart';
import 'package:slash/widgets/wallpapers_list_widget.dart';
import 'package:slash/widgets/empty_indicator.dart';
import 'package:slash/widgets/error_indicator.dart';
import '../../../../widgets/grid_view/grid_view_skeleton.dart';

class WallpapersPageContent extends StatelessWidget {
  final WallpapersState state;
  final ScrollController? scrollController;

  const WallpapersPageContent({
    super.key,
    required this.state,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
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

    return WallpapersListWidget(
      hasReachedMax: state.hasReachedMax,
      wallpapers: wallpapers,
    );
  }
}
