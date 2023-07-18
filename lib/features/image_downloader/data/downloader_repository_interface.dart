import 'package:dartz/dartz.dart';
import 'package:slash/core/failure.dart';

abstract class DownloaderRepositoryInterface {
  Future<Either<Failure, bool>> downloadFile(
    String url, {
    void Function(int, int)? onReceiveProgress,
  });
}
