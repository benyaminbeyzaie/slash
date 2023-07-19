import 'package:flutter/material.dart';
import 'package:slash/features/image_downloader/view/downloader.dart';
import 'package:slash/features/wallpapers/controller/single_wallpaper_bloc/single_wallpaper_bloc.dart';
import 'package:slash/models/full_wallpaper_model.dart';
import 'package:slash/models/uploader_model.dart';
import 'package:slash/features/wallpapers/view/widgets/color_tag.dart';
import 'package:slash/features/wallpapers/view/widgets/single_wallpaper_page_content/single_wallpaper_page_content_skeleton.dart';
import 'package:slash/utils/prettify_file_size.dart';
import 'package:slash/widgets/error_indicator.dart';
import 'package:slash/widgets/slashed_network_image.dart';

class AsyncSingleWallpaperPageContent extends StatelessWidget {
  final SingleWallpaperState state;
  final String id;

  const AsyncSingleWallpaperPageContent({
    super.key,
    required this.state,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    if (state.status == SingleWallpaperStateStatus.initial ||
        state.status == SingleWallpaperStateStatus.loading) {
      return const SingleWallpaperPageContentSkeleton();
    }

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

    return ListView(
      children: [
        Hero(
          tag: id,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 500),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Container(
                color: Colors.black,
                child: SlashedNetworkImage(imageUrl: fullModel.path),
              ),
            ),
          ),
        ),
        buildBodyBaseOnState(context, fullModel),
      ],
    );
  }

  Widget buildBodyBaseOnState(
    BuildContext context,
    FullWallpaperModel fullModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildColorTags(fullModel.colors),
        buildUploaderDetails(context, fullModel.uploader),
        buildDownloader(fullModel.path, fullModel.fileSize),
      ],
    );
  }

  Widget buildDownloader(String url, int fileSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Downloader(
        url: url,
        title: "Download ${prettifyFileSize(fileSize)}",
      ),
    );
  }

  Widget buildUploaderDetails(
    BuildContext context,
    UploaderModel uploader,
  ) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
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
                imageUrl: uploader.avatar.the128Px,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                uploader.username,
                style: textTheme.titleMedium,
              ),
              const SizedBox(height: 2),
              Text(
                uploader.group,
                style: textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildColorTags(List<String> colors) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 5,
        children: colors
            .map(
              (e) => ColorTag(
                hexString: e,
              ),
            )
            .toList(growable: false),
      ),
    );
  }
}
