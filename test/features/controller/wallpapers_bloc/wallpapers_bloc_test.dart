import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:slash/core/failure.dart';
import 'package:slash/features/wallpapers/controller/wallpapers_bloc/wallpapers_bloc.dart';
import 'package:slash/features/wallpapers/data/models/wallpaper_model.dart';
import 'package:test/test.dart';

import '../../data/models/mock_wallpaper_model.dart';
import '../../data/repository/mock_wallpaper_repository.dart';

void main() {
  group('WallpapersBloc', () {
    final mockRepository = MockWallpaperRepository();
    late WallpapersBloc wallpapersBloc;

    setUp(() {
      wallpapersBloc = WallpapersBloc(repository: mockRepository);
    });

    tearDown(() {
      wallpapersBloc.close();
    });

    test('initial state is correct', () {
      expect(wallpapersBloc.state.status, WallpapersStateStatus.initial);
    });

    test('FetchWallpapers works correctly with correct api', () async {
      when(() => mockRepository.fetchWallpapers(1)).thenAnswer(
        (_) async {
          return const Right(<WallpaperModel>[]);
        },
      );
      final ans = await mockRepository.fetchWallpapers(1);
      expect(ans, isA<Right>());
      expectLater(
        wallpapersBloc.stream,
        emitsInOrder([
          const WallpapersState(
            status: WallpapersStateStatus.success,
            page: 1,
            message: "success",
            hasReachedMax: false,
            wallpapers: [],
          ),
        ]),
      );

      wallpapersBloc.add(FetchNextWallpapers());
    });

    test('FetchWallpapers works correctly with wrong api', () async {
      when(() => mockRepository.fetchWallpapers(1)).thenAnswer(
        (_) async {
          return const Left(
            Failure(
              message: "mock fail",
              code: 456,
            ),
          );
        },
      );
      final ans = await mockRepository.fetchWallpapers(1);
      expect(ans, isA<Left>());
      expectLater(
        wallpapersBloc.stream,
        emitsInOrder([
          const WallpapersState(
            status: WallpapersStateStatus.failure,
            page: 1,
            message: "mock fail",
            hasReachedMax: false,
            wallpapers: [],
          ),
        ]),
      );

      wallpapersBloc.add(FetchNextWallpapers());
    });

    test('FetchWallpapers works correctly with multi pages', () async {
      when(() => mockRepository.fetchWallpapers(1)).thenAnswer(
        (_) async {
          return Right(<WallpaperModel>[
            MockWallpaperModel(id: "1"),
            MockWallpaperModel(id: "2"),
            MockWallpaperModel(id: "3"),
          ]);
        },
      );
      final firstAns = await mockRepository.fetchWallpapers(1);
      expect(firstAns, isA<Right>());
      when(() => mockRepository.fetchWallpapers(2)).thenAnswer(
        (_) async {
          return Right(<WallpaperModel>[
            MockWallpaperModel(id: "4"),
            MockWallpaperModel(id: "5"),
            MockWallpaperModel(id: "6"),
          ]);
        },
      );
      final secondAns = await mockRepository.fetchWallpapers(2);
      expect(secondAns, isA<Right>());

      expectLater(
        wallpapersBloc.stream,
        emitsInOrder([
          WallpapersState(
            status: WallpapersStateStatus.success,
            page: 1,
            message: "success",
            hasReachedMax: false,
            wallpapers: [
              MockWallpaperModel(id: "1"),
              MockWallpaperModel(id: "2"),
              MockWallpaperModel(id: "3"),
            ],
          ),
          WallpapersState(
            status: WallpapersStateStatus.success,
            page: 2,
            message: "success",
            hasReachedMax: false,
            wallpapers: [
              MockWallpaperModel(id: "1"),
              MockWallpaperModel(id: "2"),
              MockWallpaperModel(id: "3"),
              MockWallpaperModel(id: "4"),
              MockWallpaperModel(id: "5"),
              MockWallpaperModel(id: "6"),
            ],
          ),
        ]),
      );

      wallpapersBloc.add(FetchNextWallpapers());
      await Future.delayed(const Duration(milliseconds: 500));
      wallpapersBloc.add(FetchNextWallpapers());
    });

    test('FetchWallpapers end correctly', () async {
      when(() => mockRepository.fetchWallpapers(1)).thenAnswer(
        (_) async {
          return Right(<WallpaperModel>[
            MockWallpaperModel(id: "1"),
            MockWallpaperModel(id: "2"),
            MockWallpaperModel(id: "3"),
          ]);
        },
      );
      final firstAns = await mockRepository.fetchWallpapers(1);
      expect(firstAns, isA<Right>());
      when(() => mockRepository.fetchWallpapers(2)).thenAnswer(
        (_) async {
          return const Right(<WallpaperModel>[]);
        },
      );
      final secondAns = await mockRepository.fetchWallpapers(2);
      expect(secondAns, isA<Right>());

      expectLater(
        wallpapersBloc.stream,
        emitsInOrder([
          WallpapersState(
            status: WallpapersStateStatus.success,
            page: 1,
            message: "success",
            hasReachedMax: false,
            wallpapers: [
              MockWallpaperModel(id: "1"),
              MockWallpaperModel(id: "2"),
              MockWallpaperModel(id: "3"),
            ],
          ),
          WallpapersState(
            status: WallpapersStateStatus.success,
            page: 1,
            message: "success, ended",
            hasReachedMax: true,
            wallpapers: [
              MockWallpaperModel(id: "1"),
              MockWallpaperModel(id: "2"),
              MockWallpaperModel(id: "3"),
            ],
          ),
        ]),
      );

      wallpapersBloc.add(FetchNextWallpapers());
      await Future.delayed(const Duration(milliseconds: 500));
      wallpapersBloc.add(FetchNextWallpapers());
    });
  });
}
