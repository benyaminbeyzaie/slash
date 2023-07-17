import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'failure.dart';

Dio createDio() {
  final options = BaseOptions(
    baseUrl: 'https://wallhaven.cc/api',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  );

  final dio = Dio(options);

  return dio;
}

Future<Either<Failure, T>> fetcher<T>(Future<T> Function() fetch) async {
  try {
    return Right(await fetch());
  } on DioException catch (e) {
    final statusCode = e.response?.statusCode;

    return e.response != null
        ? Left(Failure(
            message: e.response?.data ?? "Error",
            code: statusCode,
          ))
        : Left(Failure(
            message: e.message ?? "Error",
            code: statusCode,
          ));
  } catch (e) {
    return const Left(Failure(message: "Error"));
  }
}
