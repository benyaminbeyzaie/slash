import 'package:flutter/material.dart';
import 'package:slash/features/wallpapers/controller/single_wallpaper_bloc/single_wallpaper_bloc.dart';
import 'package:slash/utils/prettify_file_size.dart';
import 'package:slash/widgets/error_indicator.dart';
import 'package:slash/widgets/slashed_network_image.dart';

import 'color_tag.dart';

class SingleWallpaperPageContent extends StatelessWidget {
  final SingleWallpaperState state;
  final String id;
  final String previewImagePath;

  const SingleWallpaperPageContent({
    super.key,
    required this.state,
    required this.id,
    required this.previewImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Hero(
          tag: id,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: SlashedNetworkImage(imageUrl: previewImagePath),
          ),
        ),
        buildBodyBaseOnState(context, state),
      ],
    );
  }

  Widget buildBodyBaseOnState(
    BuildContext context,
    SingleWallpaperState state,
  ) {
    final textTheme = Theme.of(context).textTheme;

    if (state.status == SingleWallpaperStateStatus.initial ||
        state.status == SingleWallpaperStateStatus.loading) {}
    final fullModel = state.fullWallpaperModel;
    if (state.status == SingleWallpaperStateStatus.failure ||
        fullModel == null) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: ErrorIndicator(),
        ),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: fullModel.colors
                .map(
                  (e) => ColorTag(
                    hexString: e,
                    margin: const EdgeInsets.only(right: 5),
                  ),
                )
                .toList(growable: false),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: SlashedNetworkImage(
                    imageUrl: fullModel.uploader.avatar.the128Px,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fullModel.uploader.username,
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    fullModel.uploader.group,
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: ElevatedButton(
            onPressed: null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Download ${prettifyFileSize(fullModel.fileSize)}"),
                const Icon(Icons.download),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: const LinearProgressIndicator(
                  value: 0.1,
                  minHeight: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
