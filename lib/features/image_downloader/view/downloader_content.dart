import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/features/image_downloader/controller/bloc/downloader_bloc.dart';

class DownloaderContent extends StatelessWidget {
  final DownloaderState state;
  final String url;
  final String title;

  const DownloaderContent({
    super.key,
    required this.state,
    required this.url,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    if (state.status == DownloaderStateStatus.success) {
      return buildSuccess();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDownloadButton(context),
        if (state.status == DownloaderStateStatus.downloading)
          buildProgressIndicator(),
        if (state.status == DownloaderStateStatus.failed) buildFailedText(),
      ],
    );
  }

  Widget buildFailedText() {
    return const Text(
      "Failed to download file! Try again later.",
      style: TextStyle(
        color: Colors.red,
      ),
    );
  }

  Column buildProgressIndicator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: LinearProgressIndicator(
            value: state.progress,
            minHeight: 20,
          ),
        ),
      ],
    );
  }

  ElevatedButton buildDownloadButton(BuildContext context) {
    return ElevatedButton(
      onPressed: state.status == DownloaderStateStatus.downloading
          ? null
          : () {
              BlocProvider.of<DownloaderBloc>(context).add(
                StartDownload(url: url),
              );
            },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          const Icon(Icons.download),
        ],
      ),
    );
  }

  Container buildSuccess() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(100),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            child: Text(
              "Downloaded",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            child: Icon(
              Icons.done,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
