import 'package:mocktail/mocktail.dart';
import 'package:slash/models/full_wallpaper_model.dart';
import 'package:slash/models/uploader_model.dart';

class MockFullWallpaperModel extends Mock implements FullWallpaperModel {
  @override
  final String id;
  @override
  final String path;
  @override
  final int fileSize;
  @override
  final List<String> colors;
  @override
  final UploaderModel uploader;

  MockFullWallpaperModel({
    required this.id,
    required this.path,
    required this.colors,
    required this.fileSize,
    required this.uploader,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MockFullWallpaperModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
