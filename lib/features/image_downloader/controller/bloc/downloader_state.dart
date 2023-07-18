part of 'downloader_bloc.dart';

class DownloaderState {
  final DownloaderStateStatus status;
  final double progress;

  const DownloaderState({
    required this.progress,
    required this.status,
  });
}

enum DownloaderStateStatus {
  initial,
  downloading,
  failed,
  success,
}
