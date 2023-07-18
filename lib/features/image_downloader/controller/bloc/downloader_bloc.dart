import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/features/image_downloader/data/downloader_repository_interface.dart';

part 'downloader_event.dart';
part 'downloader_state.dart';

class DownloaderBloc extends Bloc<DownloaderEvent, DownloaderState> {
  final DownloaderRepositoryInterface repository;
  DownloaderBloc({
    required this.repository,
  }) : super(
          const DownloaderState(
            status: DownloaderStateStatus.initial,
            progress: 0,
          ),
        ) {
    on<StartDownload>(download);
  }

  FutureOr<void> download(
    StartDownload event,
    Emitter<DownloaderState> emit,
  ) async {
    emit(
      const DownloaderState(
        progress: 0,
        status: DownloaderStateStatus.downloading,
      ),
    );
    final ans = await repository.downloadFile(
      event.url,
      onReceiveProgress: (downloaded, all) {
        emit(
          DownloaderState(
            progress: (downloaded / all),
            status: DownloaderStateStatus.downloading,
          ),
        );
      },
    );

    ans.fold(
      (l) => emit(
        const DownloaderState(
          status: DownloaderStateStatus.failed,
          progress: 0,
        ),
      ),
      (r) => emit(
        const DownloaderState(
          status: DownloaderStateStatus.success,
          progress: 1,
        ),
      ),
    );
  }
}
