import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:slash/features/wallpapers/controller/wallpapers_bloc/wallpapers_bloc.dart';
import 'package:slash/features/wallpapers/view/widgets/wallpapers_page_content.dart';

import 'utils/transparent_image.dart';
import 'utils/mock_file.dart';
import 'utils/test_cache_manager.dart';
import 'utils/mock_wallpaper_model.dart';

void main() {
  testGoldens('Wallpapers failure', (tester) async {
    const widget = WallpapersPageContent(
      state: WallpapersState(
        hasReachedMax: false,
        status: WallpapersStateStatus.failure,
      ),
    );
    await tester.pumpWidgetBuilder(widget);
    await multiScreenGolden(
      tester,
      'wallpapers_page_content_failure',
      devices: [
        Device.iphone11,
        Device.phone,
      ],
    );
  });

  testGoldens('Wallpapers success initial', (tester) async {
    const widget = WallpapersPageContent(
      state: WallpapersState(
        hasReachedMax: false,
        status: WallpapersStateStatus.initial,
        page: 1,
        message: "Empty",
        wallpapers: [],
      ),
    );
    await tester.pumpWidgetBuilder(widget);
    await multiScreenGolden(
      tester,
      'wallpapers_page_content_success_initial',
      customPump: (widget) {
        return widget.pump(const Duration(seconds: 1));
      },
      devices: [
        Device.iphone11,
        Device.phone,
      ],
    );
  });

  testGoldens('Wallpapers success empty', (tester) async {
    const widget = WallpapersPageContent(
      state: WallpapersState(
        hasReachedMax: false,
        status: WallpapersStateStatus.success,
        page: 1,
        message: "Empty",
        wallpapers: [],
      ),
    );
    await tester.pumpWidgetBuilder(widget);
    await multiScreenGolden(
      tester,
      'wallpapers_page_content_success_empty',
      devices: [
        Device.iphone11,
        Device.phone,
      ],
    );
  });

  testGoldens('Wallpapers success with some images', (tester) async {
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

    final widget = WallpapersPageContent(
      state: WallpapersState(
        hasReachedMax: false,
        status: WallpapersStateStatus.success,
        page: 1,
        message: "Empty",
        wallpapers: [
          MockWallpaperModel(
            id: "-1",
            dimensionX: 1,
            dimensionY: 1,
            path: "https://some.path",
          ),
          MockWallpaperModel(
            id: "-1",
            dimensionX: 1,
            dimensionY: 1,
            path: "https://some.path",
          ),
          MockWallpaperModel(
            id: "-1",
            dimensionX: 1,
            dimensionY: 1,
            path: "https://some.path",
          ),
        ],
      ),
    );
    await tester.pumpWidgetBuilder(widget);
    await multiScreenGolden(
      tester,
      'wallpapers_page_content_success_with_image',
      customPump: (widget) {
        return widget.pump(const Duration(seconds: 1));
      },
      devices: [
        Device.iphone11,
        Device.phone,
      ],
    );
  });
}
