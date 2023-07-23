import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:slash/features/wallpapers/controller/wallpapers_bloc/wallpapers_bloc.dart';
import 'package:slash/features/wallpapers/view/widgets/wallpapers_page_content.dart';
import 'package:slash/models/thumbs_model.dart';

import 'utils/init_mocked_network_image.dart';
import 'utils/material_wrapper.dart';
import 'utils/mock_wallpaper_model.dart';

void main() {
  initMockedNetworkImage();

  testGoldens('Wallpapers failure', (tester) async {
    const widget = WallpapersPageContent(
      state: WallpapersState(
        hasReachedMax: false,
        status: WallpapersStateStatus.failure,
      ),
    );
    await tester.pumpWidgetBuilder(
      widget,
      wrapper: (widget) => MaterialWrapper(
        child: widget,
      ),
    );
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
    await tester.pumpWidgetBuilder(
      widget,
      wrapper: (widget) => MaterialWrapper(
        child: widget,
      ),
    );
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
    await tester.pumpWidgetBuilder(
      widget,
      wrapper: (widget) => MaterialWrapper(
        child: widget,
      ),
    );
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
            thumbs: ThumbsModel(
              large: "https://some.path",
              original: "https://some.path",
              small: "https://some.path",
            ),
          ),
          MockWallpaperModel(
            id: "-1",
            dimensionX: 1,
            dimensionY: 1,
            path: "https://some.path",
            thumbs: ThumbsModel(
              large: "https://some.path",
              original: "https://some.path",
              small: "https://some.path",
            ),
          ),
          MockWallpaperModel(
            id: "-1",
            dimensionX: 1,
            dimensionY: 1,
            path: "https://some.path",
            thumbs: ThumbsModel(
              large: "https://some.path",
              original: "https://some.path",
              small: "https://some.path",
            ),
          ),
        ],
      ),
    );
    await tester.pumpWidgetBuilder(
      widget,
      wrapper: (widget) => MaterialWrapper(
        child: widget,
      ),
    );
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
