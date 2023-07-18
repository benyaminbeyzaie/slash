import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/features/image_downloader/controller/bloc/downloader_bloc.dart';
import 'package:slash/features/image_downloader/data/downloader_repository.dart';
import 'package:slash/features/image_downloader/view/downloader_content.dart';

class Downloader extends StatelessWidget {
  final String url;
  final String title;

  const Downloader({
    super.key,
    required this.url,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return DownloaderBloc(repository: DownloaderRepository());
      },
      child: BlocBuilder<DownloaderBloc, DownloaderState>(
        builder: (context, state) {
          return DownloaderContent(
            state: state,
            url: url,
            title: title,
          );
        },
      ),
    );
  }
}
