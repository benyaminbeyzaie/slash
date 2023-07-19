import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:slash/features/wallpapers/controller/single_wallpaper_bloc/single_wallpaper_bloc.dart';
import 'package:slash/models/avatar_model.dart';
import 'package:slash/models/uploader_model.dart';
import 'package:slash/features/wallpapers/view/widgets/single_wallpaper_page_content/single_wallpaper_page_content.dart';

import 'utils/init_mocked_network_image.dart';
import 'utils/material_wrapper.dart';
import 'utils/mock_full_wallpaper_model.dart';

void main() {
  initMockedNetworkImage();
  testGoldens('SingleWallpaper failure', (tester) async {
    const widget = Scaffold(
      body: SingleWallpaperPageContent(
        state: SingleWallpaperState(
          status: SingleWallpaperStateStatus.failure,
        ),
        previewImagePath: "https://some.path",
        id: "id",
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
      'single_wallpaper_failure',
      devices: [
        Device.iphone11,
        Device.phone,
      ],
    );
  });

  testGoldens('SingleWallpaper initial', (tester) async {
    const widget = SingleWallpaperPageContent(
      state: SingleWallpaperState(
        status: SingleWallpaperStateStatus.initial,
      ),
      previewImagePath: "https://some.path",
      id: "id",
    );

    await tester.pumpWidgetBuilder(
      widget,
      wrapper: (widget) => MaterialWrapper(
        child: widget,
      ),
    );
    await multiScreenGolden(
      tester,
      'single_wallpaper_success_initial',
      customPump: (widget) {
        return widget.pump(const Duration(seconds: 1));
      },
      devices: [
        Device.iphone11,
        Device.phone,
      ],
    );
  });
  testGoldens('SingleWallpaper success', (tester) async {
    final widget = SingleWallpaperPageContent(
      state: SingleWallpaperState(
        status: SingleWallpaperStateStatus.success,
        fullWallpaperModel: MockFullWallpaperModel(
          id: "1",
          fileSize: 10000,
          path: "https://some.path",
          uploader: UploaderModel(
            username: "username",
            group: "group",
            avatar: AvatarModel(
              the200Px: "the200Px",
              the128Px: "the128Px",
              the32Px: "the32Px",
              the20Px: "the20Px",
            ),
          ),
          colors: ["#000000", "#abbcda", "#424153", "#66cccc", "#333399"],
        ),
      ),
      previewImagePath: "https://some.path",
      id: "id",
    );

    await tester.pumpWidgetBuilder(
      widget,
      wrapper: (widget) => MaterialWrapper(
        child: widget,
      ),
    );
    await multiScreenGolden(
      tester,
      'single_wallpaper_success',
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
