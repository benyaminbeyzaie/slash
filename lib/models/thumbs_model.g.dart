// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thumbs_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThumbsModelAdapter extends TypeAdapter<ThumbsModel> {
  @override
  final int typeId = 1;

  @override
  ThumbsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ThumbsModel(
      large: fields[0] as String,
      original: fields[1] as String,
      small: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ThumbsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.large)
      ..writeByte(1)
      ..write(obj.original)
      ..writeByte(2)
      ..write(obj.small);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThumbsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
