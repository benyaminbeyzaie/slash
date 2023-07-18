import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:slash/core/failure.dart';
import 'package:url_launcher/url_launcher.dart';

import 'downloader_repository_interface.dart';

class DownloaderRepository implements DownloaderRepositoryInterface {
  final Dio dio = Dio();

  @override
  Future<Either<Failure, bool>> downloadFile(
    String url, {
    void Function(int, int)? onReceiveProgress,
  }) async {
    if (kIsWeb) {
      await launchUrl(Uri.parse(url), webOnlyWindowName: "_blank");

      return const Right(true);
    }

    try {
      final appDocDirectory = await getAppDirectory();
      final filaExtension = url.split('.').last;

      final finalFilePath = join(
        appDocDirectory.path,
        'Wallpaper-${DateTime.now().millisecondsSinceEpoch}.$filaExtension',
      );

      await dio.download(
        url,
        finalFilePath,
        onReceiveProgress: onReceiveProgress,
      );

      await saveDownloadedFileToGallery(finalFilePath);
      await removeDownloadedFile(finalFilePath);

      return const Right(true);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  Future<Directory> getAppDirectory() async {
    if (Platform.isIOS) {
      return getApplicationDocumentsDirectory();
    }

    return (await getExternalStorageDirectory())!;
  }

  Future<void> saveDownloadedFileToGallery(String filePath) async {
    await ImageGallerySaver.saveFile(filePath);
  }

  Future<void> removeDownloadedFile(String filePath) async {
    await Directory(filePath).delete(recursive: true);
  }
}
