part of 'downloader_bloc.dart';

abstract class DownloaderEvent extends Equatable {
  const DownloaderEvent();

  @override
  List<Object> get props => [];
}

class StartDownload extends DownloaderEvent {
  final String url;

  const StartDownload({required this.url});
}
