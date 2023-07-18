import 'dart:typed_data';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_file.dart';
import 'test_cache_manager.dart';
import 'transparent_image.dart';

void initMockedNetworkImage() {
  final cache = TestCacheManager();
  final mockFile = MockFile();
  when(
    () => cache.getFileStream(
      any(),
      headers: any(named: 'headers'),
      key: any(named: 'key'),
      withProgress: any(named: 'withProgress'),
    ),
  ).thenAnswer((_) async* {
    yield FileInfo(
      mockFile,
      FileSource.Cache,
      DateTime(2050),
      'url',
    );
  });

  when(
    () => mockFile.readAsBytes(),
  ).thenAnswer((_) async {
    return Uint8List.fromList(transparentImage);
  });

  GetIt.instance.registerLazySingleton<BaseCacheManager>(
    () => cache,
  );
}
