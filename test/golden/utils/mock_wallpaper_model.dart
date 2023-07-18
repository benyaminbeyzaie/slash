import 'package:mocktail/mocktail.dart';
import 'package:slash/features/wallpapers/data/models/wallpaper_model.dart';

class MockWallpaperModel extends Mock implements WallpaperModel {
  @override
  final String id;
  @override
  final int dimensionX;
  @override
  final int dimensionY;
  @override
  final String path;

  MockWallpaperModel({
    required this.id,
    required this.path,
    required this.dimensionX,
    required this.dimensionY,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MockWallpaperModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
