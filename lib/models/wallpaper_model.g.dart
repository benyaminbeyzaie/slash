// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallpaper_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WallpaperModelAdapter extends TypeAdapter<WallpaperModel> {
  @override
  final int typeId = 0;

  @override
  WallpaperModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WallpaperModel(
      id: fields[0] as String,
      url: fields[1] as String,
      shortUrl: fields[2] as String,
      views: fields[3] as int,
      favorites: fields[4] as int,
      source: fields[5] as String,
      purity: fields[6] as String,
      category: fields[7] as String,
      dimensionX: fields[8] as int,
      dimensionY: fields[9] as int,
      resolution: fields[10] as String,
      ratio: fields[12] as String,
      fileSize: fields[13] as int,
      fileType: fields[14] as String,
      createdAt: fields[15] as DateTime,
      colors: (fields[16] as List).cast<String>(),
      path: fields[17] as String,
      thumbs: fields[18] as ThumbsModel,
    );
  }

  @override
  void write(BinaryWriter writer, WallpaperModel obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.shortUrl)
      ..writeByte(3)
      ..write(obj.views)
      ..writeByte(4)
      ..write(obj.favorites)
      ..writeByte(5)
      ..write(obj.source)
      ..writeByte(6)
      ..write(obj.purity)
      ..writeByte(7)
      ..write(obj.category)
      ..writeByte(8)
      ..write(obj.dimensionX)
      ..writeByte(9)
      ..write(obj.dimensionY)
      ..writeByte(10)
      ..write(obj.resolution)
      ..writeByte(12)
      ..write(obj.ratio)
      ..writeByte(13)
      ..write(obj.fileSize)
      ..writeByte(14)
      ..write(obj.fileType)
      ..writeByte(15)
      ..write(obj.createdAt)
      ..writeByte(16)
      ..write(obj.colors)
      ..writeByte(17)
      ..write(obj.path)
      ..writeByte(18)
      ..write(obj.thumbs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WallpaperModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
