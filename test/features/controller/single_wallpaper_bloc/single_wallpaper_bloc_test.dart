import 'package:slash/features/wallpapers/controller/single_wallpaper_bloc/single_wallpaper_bloc.dart';
import 'package:test/test.dart';

import '../../data/repository/mock_wallpaper_repository.dart';

void main() {
  group('SingleWallpaperBloc', () {
    final mockRepository = MockWallpaperRepository();
    late SingleWallpaperBloc wallpaperBloc;

    setUp(() {
      wallpaperBloc = SingleWallpaperBloc(repository: mockRepository);
    });

    tearDown(() {
      wallpaperBloc.close();
    });

    test('Initial state is correct', () {
      expect(wallpaperBloc.state.status, SingleWallpaperStateStatus.initial);
    });
  });
}
